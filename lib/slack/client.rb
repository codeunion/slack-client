require 'slack/api'

module Slack
  class Client
    attr_accessor :token
    attr_reader :channels, :im, :users

    def initialize(args = {})
      @token = args[:token]

      @channels = Slack::API::Channels.new(token: @token)
      @im       = Slack::API::IM.new(token: @token)
      @users    = Slack::API::Users.new(token: @token)
    end
  end
end
