class DepthMeasurement
  def self.first(data)
    # total = data.count - 1
    # counter = 1
    # (1...total).each do |i|
    #   counter += 1 if data[i] > data[i - 1]
    # end
    # counter
    data.each_cons(2).count {|a,b| b > a}
  end

  def self.second(data)
    data.each_cons(3).map(&:sum).each_cons(2).count {|a,b| b > a}
  end
end

