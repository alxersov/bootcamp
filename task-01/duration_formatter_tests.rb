require "test/unit"
require_relative "duration_formatter"

class DurationFormatterTests < Test::Unit::TestCase
    def test_format(expected_string, seconds)
        d = DurationFormatter.new
        assert_equal(expected_string, d.format_duration(seconds))
    end

    def test_format_duration
        test_format("now", 0)
        test_format("1 second", 1)
        test_format("2 seconds", 2)
        test_format("1 minute", 60)
        test_format("1 minute and 2 seconds", 60 + 2)
        test_format("2 minutes", 2 * 60)
        test_format("1 hour and 1 second", 60 * 60 + 1)
        test_format("1 hour", 60 * 60)
        test_format("1 hour, 3 minutes and 1 second", 60 * 60 + 3 * 60 + 1)
        test_format("1 hour, 1 minute and 2 seconds", 3662)
        test_format("1 day", 24 * 60 * 60)
        test_format("1 year", 365 * 24 * 60 * 60)
    end
end
