require 'set'

class Popcorn
    Words = %w(cat dog pop corn popcorn crop corp)

    class Node
        attr_reader :connections, :char
        attr_accessor :used

        def initialize(char, connections)
            @char = char
            @used = false
            @connections = Set.new(connections)
            connections.each {|n| n.connections.add(self) }
        end

        def available_nodes
            connections.each {|n| yield(n) unless n.used}
        end
    end

    def initialize
        @wordsSet = Set.new(Words)
    end

    def word?(word)
        @wordsSet.include?(word)
    end

    def walk(node, prefix = '', &block)
        node.used = true

        word = prefix + node.char
        yield(word)
        node.available_nodes {|n| walk(n, word, &block)}

        node.used = false
    end

    def create_graph
        r = Node.new('r', [])
        p1 = Node.new('p', [r])
        n = Node.new('n', [r, p1])
        o1 = Node.new('o', [r, n])
        o2 = Node.new('o', [p1, n])
        a = Node.new('a', [p1, o1, o2, n])
        c = Node.new('c', [o1, n, a])
        p2 = Node.new('p', [o2, a, c])

        Node.new('', [r, p1, n, o1, o2, a, c, p2])
    end

    def list_words
        walk(create_graph) {|word| puts word if word?(word)}
    end
end


popcorn = Popcorn.new
popcorn.list_words
