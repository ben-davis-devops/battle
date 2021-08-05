require 'sinatra/base'
require 'sinatra/reloader'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    @name1 = params[:player1]
    session[:name1] = @name1
    @name2 = params[:player2]
    session[:name2] = @name2
    redirect "/play?name1=#{@name1}&name2=#{@name2}"
  end

  get '/play' do
    @name1 = session[:name1]
    @name2 = session[:name2]
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
  
end
