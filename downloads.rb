require 'rubygems'
require 'sinatra'

not_found do
  status 301
  redirect 'https://www.cloudwalk.io'
end

get '/:file' do |file|
  redirect "http://59ef8c7b3c1dfd2d7e71-64e65e4fc31f8f1083b5981dbfc9ea4a.r46.cf5.rackcdn.com/#{file}", 303
end

get '/:folder/:file' do |folder, file|
  redirect "http://59ef8c7b3c1dfd2d7e71-64e65e4fc31f8f1083b5981dbfc9ea4a.r46.cf5.rackcdn.com/#{folder}/#{file}", 303
end
