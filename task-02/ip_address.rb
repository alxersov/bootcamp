class IpAddress
    def initialize string_value
        @string_value = string_value
    end

    def valid?
        octets = @string_value.split('.')

        octets.length == 4 && octets.all? do |octet_str|
            octet = octet_str.to_i
            0 <= octet && octet <= 255 && octet.to_s == octet_str 
        end
    end
end
