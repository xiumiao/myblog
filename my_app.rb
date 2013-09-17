require 'sinatra/base'
require 'sinatra/contrib'
require 'redcarpet'
require_relative 'ruby_highlight'
require_relative './storage'

class MyApp < Sinatra::Base
  helpers Sinatra::Contrib
  register  Sinatra::Contrib

  get '/' do

    @pages = Page.all
    render = Redcarpet::Render::HTMLwithRuby.new
    @markdown = Redcarpet::Markdown.new(render, :autolink => true, :space_after_headers => true, :fenced_code_blocks=> true, :tables=> true)
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
