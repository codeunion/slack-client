module Slack
  module CLI
    class IM < Slack::CLI::Base
      desc 'list', 'List all IMs'
      def list
        puts client.im.list
      end

      desc 'history <channel-id>', 'Display IM history for <channel-id>'
      def history(channel_id)
        puts client.channels.history(channel: channel_id)
      end
    end
  end
end
