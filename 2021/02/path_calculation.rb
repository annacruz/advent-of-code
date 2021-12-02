class PathCalculation
  
  def self.calculate_depth_horizontal(data)
    data = data.map(&:split)
    depth = 0
    horizontal = 0
    data.each do |instruction|
      instruction[1] = instruction[1].to_i
      case instruction[0]
      when 'forward'
        horizontal += instruction[1]
      when 'down'
        depth += instruction[1]
      when 'up'
        depth -= instruction[1]
      else
        puts instruction
        puts 'ERROR ERROR ERROR'
      end
    end
    [depth, horizontal]
  end

  def self.calculate_with_aim_depth_horizontal(data)
    data = data.map(&:split)
    depth = 0
    horizontal = 0
    aim = 0
    data.each do |instruction|
      instruction[1] = instruction[1].to_i
      case instruction[0]
      when 'forward'
        horizontal += instruction[1]
        depth += aim * instruction[1] unless aim.zero?
      when 'down'
        aim += instruction[1]
      when 'up'
        aim -= instruction[1]
      else
        puts instruction
        puts 'ERROR ERROR ERROR'
      end
    end
    [depth, horizontal]
  end
end
