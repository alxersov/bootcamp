require 'set'

class Popcorn
    Words = %w(cat dog pop corn popcorn crop corp)

    class Node
        attr_reader :char

        def initialize(char)
            @char = char
        end
    end

    class Graph
        def initialize(nodes)
            @edges = {}
            nodes.each {|n| @edges[n] = []}
        end

        def add_edge (node1, node2)
            @edges[node1].push(node2)
            @edges[node2].push(node1)
        end

        def bfs (current_node = nil, visited_nodes = nil, &block)
            if current_node.nil?
                @edges.keys.each {|n| bfs(n, [], &block)}
            else
                visited_nodes.push(current_node)
                yield(visited_nodes)
                @edges[current_node].each {|n| bfs(n, visited_nodes, &block) unless visited_nodes.include?(n)}
                visited_nodes.delete(current_node)
            end
        end
    end

    def initialize
        @wordsSet = Set.new(Words)
    end

    def word?(word)
        @wordsSet.include?(word)
    end

    def create_graph
        r = Node.new('r')
        p1 = Node.new('p')
        n = Node.new('n')
        o1 = Node.new('o')
        o2 = Node.new('o')
        a = Node.new('a',)
        c = Node.new('c',)
        p2 = Node.new('p')

        graph = Graph.new([r, p1, n, o1, o2, a, c, p2])
        graph.add_edge(p1, r)
        graph.add_edge(n, r)
        graph.add_edge(n , p1)
        graph.add_edge(o1, r)
        graph.add_edge(o1, n)
        graph.add_edge(o2, p1)
        graph.add_edge(o2, n)
        graph.add_edge(a, p1)
        graph.add_edge(a, o1)
        graph.add_edge(a, o2)
        graph.add_edge(a, n)
        graph.add_edge(c, o1)
        graph.add_edge(c, n)
        graph.add_edge(c, a)
        graph.add_edge(p2, o2)
        graph.add_edge(p2, a)
        graph.add_edge(p2, c)

        graph
    end

    def list_words
        create_graph.bfs do |visited_nodes|
            word = visited_nodes.map{|n| n.char}.join
            puts word if word? word
        end
    end
end


popcorn = Popcorn.new
popcorn.list_words
