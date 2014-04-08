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
    id = params[:id].to_i - 1
    redirect_page = URLS[id][:old_url]
    if redirect_page =~ /\Ahttps?:\/\//
      redirect redirect_page
    else
      redirect "http://#{redirect_page}"
    end
  end
end