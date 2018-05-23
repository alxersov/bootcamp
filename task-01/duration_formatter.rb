class DurationFormatter
    class TimeSpan
        attr_reader :name, :duration_in_seconds

        def initialize(name, duration_in_seconds)
            @name = name
            @duration_in_seconds = duration_in_seconds
        end

        def format(seconds)
            value = seconds / duration_in_seconds
            
            if value == 0
                nil
            else
                "#{value} #{name}#{'s' if value > 1}"
            end
        end
    end

    def format_duration seconds
        return 'now' if seconds == 0

        spans = [
            TimeSpan.new("year", 365 * 24 * 60 * 60),
            TimeSpan.new("day", 24 * 60 * 60),
            TimeSpan.new("hour", 60 * 60),
            TimeSpan.new("minute", 60),
            TimeSpan.new("second", 1)
        ]

        span_strings = spans.map do |s|
            v = s.format(seconds)
            seconds %= s.duration_in_seconds
            v
        end.reject(&:nil?)

        first_part = span_strings[0..-2].join(', ')
        last_part = span_strings[-1]
        if first_part != ''
            "#{first_part} and #{last_part}"
        else
            last_part
        end
    end
end
