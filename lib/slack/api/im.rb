module Slack
  module API
    class IM < Slack::API::Base
      def history(args = {})
        fail ArgumentError, 'channel is required' unless args.key?(:channel)

        get('im.history', args)
      end

      def list(args = {})
        get('im.list', args)
      end
    end
  end
end
