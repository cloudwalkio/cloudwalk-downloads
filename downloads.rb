require 'rubygems'
require 'sinatra'

get '/:file' do |file|
  redirect "http://dl.getdropbox.com/u/436039/cloudwalk/#{file}", 303
end

get '*' do |file|
  redirect "https://www.cloudwalk.io"
end
