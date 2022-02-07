# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min if self.all? { |ele| ele.is_a?(Integer) }  
    end

    def average
        return nil if self.empty?
        (self.sum.to_f / self.length) if self.all? { |ele| ele.is_a?(Integer) }
    end
        
    def median
        return nil if self.empty?
        sorted = self.sort

        if self.length.odd? 
            sorted[sorted.length / 2]
        else
            mid_r = sorted[sorted.length / 2]
            mid_l = sorted[(sorted.length / 2) - 1]
            avg = ((mid_r + mid_l) / 2.0)
            avg
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |n| count[n] += 1 }
        count
    end

    def my_count(val)
        count = 0
        self.each do |ele| 
            if ele == val
                count += 1
            end
        end
        count
    end

    def my_index(val)
        self.each_with_index do |ele, i|
            return i if ele == val
        end
        nil
    end

    def my_uniq
        h = {}
        self.each { |ele| h[ele] = true }
        h.keys
    end

    def my_transpose
        shell = Array.new(self.length) { Array.new(self.length) }

        self.each_with_index do |array, i|
            array.each_with_index do |ele, i2|
                shell[i2][i] = ele
            end
        end

        shell
    end
end
