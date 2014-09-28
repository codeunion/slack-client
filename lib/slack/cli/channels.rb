module Slack
  module CLI
    class Channels < Slack::CLI::Base
      desc 'list', 'List all channels'
      def list
        puts client.channels.list
      end

      desc 'history <channel-id>', 'Print channel history for <channel-id>'
      def history(channel_id)
        puts client.channels.history(channel: channel_id)
      end

      desc 'info <channel-id>', 'Print channel info for <channel-id>'
      def info(channel_id)
        puts client.channels.history(channel: channel_id)
      end
    end
  end
end
