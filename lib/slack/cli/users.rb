module Slack
  module CLI
    class Users < Slack::CLI::Base
      desc 'list', 'List all Slack users'
      def list
        puts client.users.list
      end

      desc 'info <user-id>', 'Display user info for <user-id>'
      def info(user_id)
        results = wrap_json(client.users.list) do |data|
          data['members'].find { |m| m['id'] == user_id }
        end

        puts results
      end
    end
  end
end
