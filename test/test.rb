require 'sinatra/base'

class Test < Sinatra::Base
	get "/test" do
		'hello,this is a test'
	end
end
