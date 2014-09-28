require 'slack/client'

require 'thor'
require 'multi_json'

module Slack
  module CLI
    CONFIG_DIR  = File.join(Dir.home, '.slack-client')
    CONFIG_FILE = File.join(CONFIG_DIR, 'config')

    class Base < Thor
      class_option :token,
        aliases:     '-t',
        desc:        'Your Slack API token'

      private

      def dump_json(obj)
        MultiJson.dump(obj)
      end

      def load_json(json)
        MultiJson.load(json)
      end

      def wrap_json(json)
        dump_json(yield(load_json(json)))
      end

      def client
        @client ||= Slack::Client.new(token: client_token)
      end

      def client_token
        options[:token] || ENV['SLACK_TOKEN']
      end
    end
  end
end
