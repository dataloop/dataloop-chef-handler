require "chef"
require "chef/handler"

require "timeout"
require "net/http"
require "net/https"
require "uri"

class Chef::Handler::Dataloop < Chef::Handler
    attr_writer :api_token, :host, :org, :account, :stream

    def initialize(options = {})
      @host      = options[:host] || 'app.dataloop.io'
      @api_token = options[:api_token] || ''
      @org       = options[:org] || ''
      @account   = options[:account] || ''
      @stream    = options[:stream] || "chef"
    end


    def report
       Chef::Log.debug("Loaded dataloop chef handler")

       metrics = Hash.new
       metrics[:updated_resources] = run_status.updated_resources.length if run_status.updated_resources
       metrics[:all_resources] = run_status.all_resources.length if run_status.all_resources
       metrics[:elapsed_time] = run_status.elapsed_time

      if run_status.success?
          metrics[:success] = 1
          metrics[:fail] = 0
          status_message = "success"
      else
          metrics[:success] = 0
          metrics[:fail] = 1
          status_message = "failed"
      end

      # metrics.each do |metric, value|
      #   puts "#{metric} #{value}"
      # end

      uri =  URI.parse("https://#{@host}/napi/v1/orgs/#{@org}/accounts/#{@account}/annotations/#{@stream}")
      https = Net::HTTP.new(uri.host,uri.port)
      https.use_ssl = true
      req = Net::HTTP::Post.new(uri.path)
      req.add_field('Authorization', "Bearer #{@api_token}")
      req.add_field('Content-Type', 'application/json')
      req.body = '{"name": "'+run_status.node.name.to_s+'", "description": "'+status_message+'"}'
      begin
        response = https.request(req)
      # rescue StandardError => e
      rescue Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
        Chef::Log.error("failed to annotate Dataloop @ '#{@host}' :- #{e}")
      end
    end
end
