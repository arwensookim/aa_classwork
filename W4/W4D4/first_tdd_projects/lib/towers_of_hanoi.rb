class TowersOfHanoi
    attr_reader :stack
    def initialize
        @stack = [[1,2,3],[],[]]
    end

    def valid_move?(from, to)
        return false if !from.between?(0,2) && !to.between?(0,2)
        return true if !@stack[from].empty? && (@stack[to].empty? || @stack[to].first > @stack[from].first)
    end
    
    def move(from, to)
        raise "Invalid move" if @stack[from].empty?
        raise "Can not move disc on top of a smaller disc" unless valid_move?(from, to)
        disc = @stack[from].shift
        @stack[to] << disc if valid_move?(from, to)
    end

end