#require 'pry'
require 'sinatra/base'
#require 'rack/webconsole'
require 'sinatra/contrib'
#require 'sinatra/content_for'
#require 'sinatra/reloader' if development?
require_relative './storage'

class MyApp < Sinatra::Base
  helpers Sinatra::Contrib
  register  Sinatra::Contrib

  get '/' do
    #binding.pry
    @pages = Page.all
    erb :index
  end

  get '/edit/:id.html' do
    erb :editor
  end

  post '/edit/:id.html' do

    erb :editor
  end

  not_found do
    "404 found!"
  end
end
