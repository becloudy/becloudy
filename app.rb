require 'sinatra'
require 'slim'
require 'sass'

if ENV['RACK_ENV'] == 'production'
  require 'newrelic_rpm'
  NewRelic::Agent.manual_start :app_name => 'becloudy'
end

module BeCloudy
  class App < Sinatra::Application
    get '/' do
      slim :index
    end

    get '/css/:name.css' do
      content_type 'text/css', :charset => 'utf-8'
      sass(:"stylesheets/#{params[:name]}")
    end

    not_found do
      redirect '/'
    end
  end
end
