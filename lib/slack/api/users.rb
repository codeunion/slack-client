module Slack
  module API
    class Users < Slack::API::Base
      def list(args = {})
        get('users.list', args)
      end
    end
  end
end
