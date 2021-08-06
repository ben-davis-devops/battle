require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/player.rb'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    redirect "/play?name1=#{@name1}&name2=#{@name2}"
  end

  get '/play' do
    @name1 = $player1.name
    @name2 = $player2.name
    erb :play
  end

  get '/attack' do
    @player1 = $player1
    @player2 = $player2
    @player1.attack(@player2)
    erb :attack
  end  

  # start the server if ruby file executed directly
  run! if app_file == $0
  
end
