require 'sinatra'
require 'slim'
require 'sass'

module BeCloudy
  class App < Sinatra::Application
    get '/' do
      slim :index
    end

    get '/css/:name.css' do
      content_type 'text/css', :charset => 'utf-8'
      sass(:"stylesheets/#{params[:name]}")
    end
  end
end

