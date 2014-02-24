class Sunspot
  attr_reader :coords
  attr_reader :value
  attr_reader :neighbours

  def initialize value, coords
    @value = value
    @coords = coords
  end

  def set(neighbours)
    @neighbours = neighbours.map { |neighbour| neighbour.value }
  end

  def sunspot_value
    sum_of_neighbours
  end

  def sum_of_neighbours
    @neighbours.empty? ? 0 : @neighbours.reduce(:+)
  end
end
