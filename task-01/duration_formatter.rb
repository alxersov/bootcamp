class DurationFormatter
    class TimeSpan
        def initialize(name, max_value = nil, next_span = nil)
            @name = name
            @max_value = max_value
            @next_span = next_span
        end

        def format(value)
            spans = @next_span ? @next_span.format(value / @max_value) : []

            value %= @max_value if @max_value
            if value > 0
                spans.push("#{value} #{@name}#{'s' if value > 1}")
            end

            spans
        end
    end

    def format_duration seconds
        return 'now' if seconds == 0

        year = TimeSpan.new("year")
        day = TimeSpan.new("day", 365, year)
        hour = TimeSpan.new("hour", 24, day)
        minute = TimeSpan.new("minute", 60, hour)
        second = TimeSpan.new("second", 60, minute)

        spans = second.format(seconds)

        if spans.length == 1
            spans[0]
        else
            [spans[0..-2].join(', '), spans[-1]].join(' and ')
        end
    end
end
