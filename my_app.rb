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

  get '/edit' do
    erb :editor
  end

  post '/edit' do
    @page = Page.new(params[:title],"coolwar",params[:contents])
    @page.url = params[:url]
    @page.save
    redirect '/'
  end

  not_found do
    "404 found!"
  end
end
