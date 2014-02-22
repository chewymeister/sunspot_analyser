require 'sinatra/base'

class SunspotAnalyserApp < Sinatra::Base
  get '/' do
    'Hello sunspot_analyser_app!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
