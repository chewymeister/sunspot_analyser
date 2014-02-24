require_relative './sunspot'
require_relative './locator'

class SunspotAnalyser
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

  def number_of_outputs
    @input[0].to_i
  end

  def extract_data_from(input)
    input[2..-1].chars
  end

  def format_results
    results.inject([]) { |result, sunspot| result << format_output_for(sunspot) }
  end

  def desired_results_from(sunspots)
    sunspots.reverse.slice(0, number_of_outputs)
  end

  def results
    desired_results_from(sorted_sunspots)
  end

  def sorted_sunspots
    @sunspots.sort_by { |sunspot| sunspot.sunspot_value }
  end

  def initialize_sunspots
    results = []
    @data.each_with_index do |value, index|
      results << Sunspot.new(value.to_i, coords_from(index))
    end
    @sunspots = @locator.assign_sunspot_neighbours(results)
  end

  def format_output_for(sunspot)
    [ sunspot.coords.values , score: sunspot.sunspot_value.to_s ]
  end

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
