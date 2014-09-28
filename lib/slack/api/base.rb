require 'faraday'
require 'addressable/template'

module Slack
  module API
    class Base
      attr_reader :default_args

      def initialize(default_args = {})
        @default_args = default_args
      end

      def get(endpoint, args = {})
        Faraday.get(api_url(endpoint, default_args.merge(args))).body
      end

      private

      URL_TEMPLATE =
        Addressable::Template.new('https://slack.com/api/{endpoint}{?args*}')

      def api_url(endpoint, args = {})
        URL_TEMPLATE.expand(endpoint: endpoint, args: args)
      end
    end
  end
end
