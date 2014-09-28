# Slack::Client

A basic Slack API client written in Ruby.  Currently the client returns the raw
JSON response it receives from Slack's server.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slack-client'
```

And then execute:

```text
$ bundle
```

Or install it yourself as:

```text
$ gem install slack-client
```

## Usage (API Client)

```ruby
require 'slack/client'

SLACK_API_TOKEN="<your Slack API token goes here>"

client = Slack::Client.new(token: SLACK_API_TOKEN)

puts client.users.list
puts client.channels.list
puts client.channels.history('C1234567')
```

## Usage (Command-Line App)

We recommend installed [jq](http://stedolan.github.io/jq/), a flexible
command-line JSON processor.  Here are some basic commands:

```text
$ slack help
$ slack config set SLACK_TOKEN="<your Slack API token goes here>"
$ slack users list
$ slack channels info
$ slack channels history C1234567
```

With `jq`, you can do things like

```text
$ slack users list | jq '.members | map({(.id): .name})'
```

which will print out a list of Slack User ID + Name pairs.

## Contributing

1. Fork it (<https://github.com/codeunion/slack-client/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
