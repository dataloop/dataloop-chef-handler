# dataloop-chef-handler Cookbook

This cookbook installs a chef handler that will annotate your Dataloop account with a success or failure
annotation each time chef is run on a node

## Requirements

Should run on any platform that runs chef

Depends on the `chef_handler` community cookbook

## Attributes

TODO: List your cookbook attributes here.

e.g.
### dataloop-chef-handler::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['dataloop-chef-handler']['api_token']</tt></td>
    <td>String</td>
    <td>Your Dataloop API Token, found in `Account settings`</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['dataloop-chef-handler']['org']</tt></td>
    <td>String</td>
    <td>The Dataloop Org this node belongs to</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['dataloop-chef-handler']['account']</tt></td>
    <td>String</td>
    <td>The Dataloop Account this node belongs to</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['dataloop-chef-handler']['stream']</tt></td>
    <td>String</td>
    <td>The stream to annotate in Dataloop</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### dataloop-chef-handler::default

Add the `dataloop-chef-handler` early in your run list so that it is registered with the chef run

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dataloop-chef-handler]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: Tom Ashley <tom.ashley at dataloop.io>

