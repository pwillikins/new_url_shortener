require "sinatra/base"

class App < Sinatra::Application

  URLS = []

  get '/' do
    erb :index
  end

  post '/stats' do
    old_url = params[:old_url]
    id = URLS.count + 1
    shortened_url = "#{request.base_url}/#{id}"
    URLS << {:shortened_url => shortened_url, :old_url => old_url}
    erb :stats, locals: {:old_url => old_url, :shortened_url => shortened_url, :id => id}
  end

  get '/:id' do
    redirect_page = URLS[0][:old_url]
    redirect redirect_page
  end

end
