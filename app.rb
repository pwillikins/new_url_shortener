require "sinatra/base"

class App < Sinatra::Application

  URLS = {}

  get '/' do
    erb :index
  end

  post '/stats' do
    old_url = params[:old_url]
    id = URLS.length + 1
    shortened_url = "http://stagingurl.herokuapp.com/#{id}"
    URLS << {
      :old_url => old_url,
      :shortened_url => shortened_url}
    erb :stats, :locals => {:old_url => old_url, :shortened_url => shortened_url}
  end
end

