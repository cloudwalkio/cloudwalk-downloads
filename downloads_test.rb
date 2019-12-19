ENV['RACK_ENV'] = 'test'

require File.expand_path('downloads.rb')
require 'test/unit'
require 'rack/test'

class DownloadsTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_shoult_redirect_to_file
    get '/file.zip'

    assert last_response.status, '303'
    assert last_response.location.include?('/file.zip')
  end

  def test_shoult_redirect_to_file_inside_a_folder
    get '/folder/file.zip'

    assert last_response.status, '303'
    assert last_response.location.include?('/folder/file.zip')
  end

  def test_shoult_redirect_to_cloudwalk_when_not_found
    get '/other/foo/bar'

    assert last_response.status, '301'
    assert last_response.location, 'https://www.cloudwalk.io'
  end
end
