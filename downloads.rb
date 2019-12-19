require 'rubygems'
require 'sinatra'

not_found do
  redirect 'https://www.cloudwalk.io', 301
end

get '/:file' do |file|
  redirect "#{rackcdn_url}/#{file}", 303
end

get '/:folder/:file' do |folder, file|
  redirect "#{rackcdn_url}/#{folder}/#{file}", 303
end

helpers do
  def rackcdn_url
    'http://59ef8c7b3c1dfd2d7e71-64e65e4fc31f8f1083b5981dbfc9ea4a.r46.cf5.rackcdn.com'
  end
end
