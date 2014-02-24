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
    @sunspots = @data.map { |value| Sunspot.new(value) }
    @sunspots.each_with_index do |sunspot, index|
      sunspot.location = coords_from(index)
      sunspot.receive(neighbours_with(index))
    end
    @results = @sunspots.sort_by { |sunspot| sunspot.sunspot_value.to_i }.reverse.slice(0, @output_quantity)
    @results.inject([]) { |set, sunspot| set << format_hash_with(sunspot) }
  end

  def format_hash_with(sunspot)
    [ sunspot.location, score: sunspot.sunspot_value.to_s ]
  end

  def coords_from(index)
    [x_coord(index), y_coord(index)]
  end

  def neighbours_with(p_index)
    result = []
    @sunspots.each_with_index do |sunspot, index|
      result << sunspot if in_range(p_index, index) && p_index != index
    end
    result
  end

  def in_range(p_index, index)
    ((y_coord(p_index) - 1 )..(y_coord(p_index) + 1)).include?(y_coord(index)) &&
     ((x_coord(p_index) - 1 )..(x_coord(p_index) + 1)).include?(x_coord(index)) 
  end

  def y_coord(index)
    index.to_i / @delimiter.to_i
  end

  def x_coord(index)
    index.to_i % @delimiter.to_i
  end
end
