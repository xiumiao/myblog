require 'sinatra/base'
require 'sinatra/contrib'
require 'redcarpet'
require_relative './storage'

class MyApp < Sinatra::Base
  helpers Sinatra::Contrib
  register  Sinatra::Contrib

  get '/' do

    @pages = Page.all
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    erb :index
  end

  get '/edit/:id.html' do
    erb :editor
  end

  post '/edit/:id.html' do
    @page = Page.new(params[:id],"coolwar",params[:contents])
    @page.save
    redirect '/'
  end

  not_found do
    "404 found!"
  end
end
