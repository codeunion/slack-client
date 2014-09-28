module Slack
  module Utils
    module_function

    # Public: Extracts the timestamp information encoded in a Slack-style
    # timestamp (e.g., "p1409120227001488").
    #
    # slack_ts - The Slack-tyle timestamp, e.g., "p1409120227001488"
    #
    # Returns a Float containing the timestamp in UNIX time w/ milliseconds.
    #
    # Examples
    #
    #   parse_slack_timestamp("p1409120227001488") # => 1409120227.001488
    #   parse_slack_timestamp("s1409192267000101") # => 1409192267.000101
    def self.parse_slack_timestamp(slack_ts)
      if match = slack_ts.match(/\A[a-z](\d+)\z/i)
        match[1].to_f / 10**6
      else
        fail ArgumentError,
          "argument does not look like a Slack timestamp (got `#{slack_s}')"
      end
    end
  end
end
