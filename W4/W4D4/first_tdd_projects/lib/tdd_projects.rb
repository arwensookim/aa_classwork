def my_uniq(array)
    new_arr = []
    array.each { |ele| new_arr << ele if !new_arr.include?(ele) }
    new_arr
end

class Array
    def two_sum
        new_arr = []
        self.each_with_index do |ele1, i|
            (i+1...self.length).each do |j|
                new_arr << [i,j] if self[i] + self[j] == 0
            end
        end
        new_arr
    end
end

def my_transpose(arr)
    new_arr = []

    (0...arr.length).each do |i|
        subArr = []
        (0...arr.length).each do |j|
            subArr << arr[j][i]
        end
        new_arr << subArr
    end

    new_arr
end

def stock_picker(prices)
    profitable = []
    highest_profit = 0

    prices.values.each_with_index do |price, i|
        (i+1...prices.values.length).each do |j|
            if prices.values[j] - prices.values[i] > highest_profit
                profitable << [prices.keys[i],prices.keys[j]]
                highest_profit = prices.values[j] - prices.values[i]
            end
        end
    end

    profitable.last
end

