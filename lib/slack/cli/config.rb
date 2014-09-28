module Slack
  module CLI
    class Config < Slack::CLI::Base
      desc 'set <OPTION="value" ...>',
        "Update settings #{Slack::CLI::CONFIG_FILE}"
      def set(*args)
        unless Dir.exist?(Slack::CLI::CONFIG_DIR)
          Dir.mkdir(Slack::CLI::CONFIG_DIR)
        end

        File.open(Slack::CLI::CONFIG_FILE, 'w') do |f|
          f.puts args
        end
      end
    end
  end
end
