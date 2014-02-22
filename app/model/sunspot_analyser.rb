class SunspotAnalyser
  attr_reader :delimiter

  def initialize(input)
    @input = input
    @delimiter = @input[1]
    @data = extract_data_from(input)
    @rows_of_data = arrange_into_rows
  end

  def extract_data_from(input)
    input[2..-1].chars
  end

  def arrange_into_rows
    @data.each_slice(@delimiter.to_i).to_a
  end

  def output
    # [0,0, score: "1"]
  end

end
