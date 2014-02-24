require_relative './sunspot'

class SunspotAnalyser
  attr_reader :delimiter

  def initialize(input)
    @delimiter = input[1]
    @output_quantity = input[0].to_i
    @data = extract_data_from(input)
  end

  def extract_data_from(input)
    input[2..-1].chars
  end

  def output
    initialize_sunspots
    @sunspots.each { |sunspot| sunspot.calculate_sunspot_value }
    @results = @sunspots.sort_by { |sunspot| sunspot.sunspot_value.to_i }.reverse.slice(0, @output_quantity)
    @results.inject([]) { |set, sunspot| set << format_hash_with(sunspot) }
  end

  def initialize_sunspots
    @sunspots = []
    @data.each_with_index do |value, index|
      @sunspots << Sunspot.new(value, coords_from(index))
    end
    @sunspots.each { |sunspot| sunspot.receive(neighbours_at(sunspot.coords)) }
  end

  def format_hash_with(sunspot)
    [ sunspot.coords, score: sunspot.sunspot_value.to_s ]
  end

  def coords_from(index)
    [x_coord(index), y_coord(index)]
  end

  def neighbours_at(coords)
    result = []
    @sunspots.each_with_index do |sunspot, index|
      result << sunspot if in_range(coords, index)
    end
    result
  end

  def in_range(coords, index)
    ((coords[0] - 1)..(coords[0] + 1)).include?(x_coord(index)) &&
     ((coords[1] - 1)..(coords[1] + 1)).include?(y_coord(index))
  end

  def y_coord(index)
    index.to_i / @delimiter.to_i
  end

  def x_coord(index)
    index.to_i % @delimiter.to_i
  end
end
