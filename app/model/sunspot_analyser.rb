require_relative './sunspot'
# require_relative './locator'

class SunspotAnalyser
  attr_reader :delimiter

  def initialize(input)
    @input = input
    @data = extract_data_from(input)
    @locator = Locator.new
  end

  def output
    initialize_sunspots
    format_results
  end

  private

  def delimiter
    @input[1].to_i
  end

  def output_quantity
    @input[0].to_i
  end

  def extract_data_from(input)
    input[2..-1].chars
  end

  def format_results
    results.inject([]) { |result, sunspot| result << format_output_for(sunspot) }
  end

  def desired_results_from(sunspots)
    sunspots.reverse.slice(0, output_quantity)
  end

  def results
    desired_results_from(sorted_sunspots)
  end

  def sorted_sunspots
    @sunspots.sort_by { |sunspot| sunspot.sunspot_value }
  end

  def initialize_sunspots
    @sunspots = []
    @data.each_with_index do |value, index|
      @sunspots << Sunspot.new(value.to_i, coords_from(index))
    end
    assign_sunspot_neighbours
  end

  def format_output_for(sunspot)
    [ sunspot.coords.values , score: sunspot.sunspot_value.to_s ]
  end
# ========================================================================================
  def assign_sunspot_neighbours
    #includes itself as its coords are within range specified
    @sunspots.each { |sunspot| sunspot.set(neighbours_at(sunspot.coords)) }
  end

  def neighbours_at(coords)
    @sunspots.select { |sunspot| in_range?(coords, sunspot.coords) }
  end

  def in_range?(coords, candidate_coords)
    neighbours?(:x, candidate_coords, coords) && neighbours?(:y, candidate_coords, coords)
  end

  def neighbours?(axis, candidate_coords, coords)
    ((coords[axis] - 1)..(coords[axis] + 1)).include?(candidate_coords[axis])
  end
# ========================================================================================
  def coords_from(index)
    { x: x_coord(index), y: y_coord(index) }
  end

  def y_coord(index)
    index / delimiter
  end

  def x_coord(index)
    index % delimiter
  end
end

class Locator
end
