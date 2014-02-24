class Sunspot
  attr_accessor :location
  attr_reader :sunspot_value
  def initialize value
    @value = value.to_i
  end

  def value
    @value.to_s
  end

  def make_sunspot_value
    (sum_of_neighbours + @value).to_s
  end

  def receive(neighbours)
    @neighbours = neighbours.map { |neighbour| neighbour.value.to_i }
    @sunspot_value = make_sunspot_value
  end

  def sum_of_neighbours
    @neighbours.empty? ? 0 : @neighbours.reduce(:+)
  end
end
