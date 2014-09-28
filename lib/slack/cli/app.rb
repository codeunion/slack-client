module Slack
  module CLI
    class App < Slack::CLI::Base
      desc 'channels SUBCOMMAND ...ARGS', 'Channel-related commands'
      subcommand 'channels', Slack::CLI::Channels

      desc 'im SUBCOMMAND ...ARGS', 'IM-related commands'
      subcommand 'im', Slack::CLI::IM

      desc 'users SUBCOMMAND ...ARGS', 'User-related commands'
      subcommand 'users', Slack::CLI::Users

      desc 'config SUBCOMMAND ...ARGS', 'Configuration-related commands'
      subcommand 'config', Slack::CLI::Config

      method_option :oldest,
        aliases: '-o',
        type:    'string',
        desc:    'Slack timestamp of the oldest message to export'
      method_option :latest,
        aliases: '-l',
        type:    'string',
        desc:    'Slack timestamp of the latest message to export'
      method_option :count,
        aliases: '-c',
        type:    'numeric',
        desc:    'Maximum number of messages to export'

      desc 'export <channel-id> [OPTIONS]',
        'Export Slack data from <channel-id>.'
      def export(channel_id)
        args = options.merge(channel: channel_id)

        if args.key?(:oldest)
          parse_slack_timestamp(args[:oldest])
        end

        if args.key?(:latest)
          args[:latest] = parse_slack_timestamp(args[:latest])
        end

        case channel_id
        when /^C/
          puts client.channels.history(args)
        when /^D/
          puts client.im.history(args)
        else
          fail ArgumentError, "Unknown channel format (got `#{channel_id}')"
        end
      end
    end
  end
end
