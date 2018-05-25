def combine(a, b)
    r = []
    a.each{|s1| b.each{|s2| r.push(s1 + s2)}}
    r
end

def canonical(s)
    s[0,2] = 'Aa' if s[0,2] == 'aA'
    s[2,2] = 'Tt' if s[2,2] == 'tT'
    s
end

colors = {
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

horse1 = 'AaTt'
horse2 = 'AaTt'

a = combine(horse1[0,2].chars, horse2[0,2].chars)
t = combine(horse1[2,2].chars, horse2[2,2].chars)

counts = Hash.new(0)
combine(a, t).each do |s|
    counts[canonical(s)] += 1
end

counts.keys.each do |c|
    puts("#{colors[c]} (#{c}) -  #{counts[c]/16.0*100}%")
end
