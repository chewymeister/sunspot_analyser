class Sunspot
  attr_reader :coords
  attr_reader :sunspot_value
  def initialize value, coords
    @value = value.to_i
    @coords = coords
  end

  def receive(neighbours)
    #includes itself as its coords is within range specified in analyser
    @neighbours = extract_values_from(neighbours)
  end

  def value
    @value.to_s
  end

  def calculate_sunspot_value
    @sunspot_value = (sum_of_neighbours).to_s
  end

  def extract_values_from(neighbours)
    neighbours.map { |neighbour| neighbour.value.to_i }
  end

  def sum_of_neighbours
    @neighbours.empty? ? 0 : @neighbours.reduce(:+)
  end
end
