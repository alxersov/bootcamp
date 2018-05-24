class DurationFormatter
    class TimeSpan
        def initialize(name, duration_in_seconds, max_value)
            @name = name
            @duration_in_seconds = duration_in_seconds
            @max_value = max_value
        end

        def format(seconds)
            value = seconds / @duration_in_seconds

            value %= @max_value if @max_value
            
            if value == 0
                nil
            else
                "#{value} #{@name}#{'s' if value > 1}"
            end
        end

        def max_value_in_seconds
            @max_value.nil? ? nil : @max_value * @duration_in_seconds
        end
    end

    def format_duration seconds
        return 'now' if seconds == 0

        second = TimeSpan.new("second", 1, 60)
        minute = TimeSpan.new("minute", second.max_value_in_seconds, 60)
        hour = TimeSpan.new("hour", minute.max_value_in_seconds, 24)
        day = TimeSpan.new("day", hour.max_value_in_seconds, 365)
        year = TimeSpan.new("year", day.max_value_in_seconds, nil)

        spans = [
            year, day, hour, minute, second
        ]

        span_strings = spans.map do |s|
            s.format(seconds)
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
