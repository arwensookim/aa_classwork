class Array

    def my_each(&prc)
        
        new_arr = self.map do |el|
            prc.call(el)
        end
        new_arr
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |el|
            new_arr << el if prc.call(el)
        end
        new_arr
    end

end
