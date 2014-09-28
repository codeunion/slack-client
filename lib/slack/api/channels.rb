module Slack
  module API
    class Channels < Slack::API::Base
      def info(args = {})
        fail ArgumentError, 'channel is required' unless args.key?(:channel)

        get('channels.list', args)
      end

      def history(args = {})
        fail ArgumentError, 'channel is required' unless args.key?(:channel)

        get('channels.history', args)
      end

      def list(args = {})
        get('channels.list', args)
      end
    end
  end
end
