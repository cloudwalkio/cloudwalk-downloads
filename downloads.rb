require 'rubygems'
require 'sinatra'

get '/:file' do |file|
	redirect "http://dl.getdropbox.com/u/436039/cloudwalk/#{file}", 303
end

get '/:folder/:file' do |folder, file|
  redirect "http://dl.getdropbox.com/u/436039/cloudwalk/#{folder}/#{file}", 303
end

get '*' do |file|
  redirect "http://cloudwalk.io"
end