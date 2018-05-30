class Breeding
    def self.combine(a, b)
        r = []
        a.each{|s1| b.each{|s2| r.push(s1 + s2)}}
        r
    end

    def self.canonical(s)
        s[0,2] = 'Aa' if s[0,2] == 'aA'
        s[2,2] = 'Tt' if s[2,2] == 'tT'
        s
    end

    @@colors = {
        'AAtt' => 'Alizarin crimson',
        'AATt' => 'Alloy orange',
        'AATT' => 'Almond',
        'Aatt' => 'Amaranth',
        'AaTt' => 'Amber',
        'AaTT' => 'Begonia',
        'aatt' => 'Bittersweet',
        'aaTt' => 'Blush',
        'aaTT' => 'Cadmium'
    }

    def self.colors
        @@colors
    end

    def self.breed(horse1, horse2)
        gens1 = horse1.gens
        gens2 = horse2.gens

        a = combine(gens1[0,2].chars, gens2[0,2].chars)
        t = combine(gens1[2,2].chars, gens2[2,2].chars)
        at = combine(a, t)

        counts = Hash.new(0)
        at.each { |g| counts[canonical(g)] += 1 }

        puts('Breeding chances:')
        counts.keys.each do |c|
            puts("#{colors[c]} (#{c}) - #{counts[c]/16.0*100}%")
        end
    end

    class Horse
        attr_reader :gens

        def initialize color
            @gens = nil
            Breeding.colors.each {|g, c| @gens = g if c == color}

            raise ArgumentError.new('Unknown color') if @gens.nil?
        end
    end
end


freddy = Breeding::Horse.new("Alizarin crimson")
teddy = Breeding::Horse.new("Begonia")
Breeding::breed(freddy, teddy)

horsie1 = Breeding::Horse.new("Amber")
horsie2 = Breeding::Horse.new("Amber")
Breeding::breed(horsie1, horsie2)
