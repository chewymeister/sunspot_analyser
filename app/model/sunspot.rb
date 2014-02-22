class Sunspot
  def initialize value
    @value = value.to_i
  end

  def value
    @value.to_s
  end

  def sunspot_value
    (sum_of_neighbours + @value).to_s
  end

  def receive(neighbours)
    @neighbours = neighbours.map { |neighbour| neighbour.value.to_i }
  end

  def sum_of_neighbours
    @neighbours.empty? ? 0 : @neighbours.reduce(:+)
  end
end
