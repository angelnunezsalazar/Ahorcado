require_relative "lib/game"
require 'rubygems' if RUBY_VERSION < '1.9'
require 'sinatra'
configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

get "/" do
	@@ahorcado=Ahorcado.new
	erb :home
end

get "/comenzarjuego" do
	initial_qty_failed_chars=0
	secret_word=params["palabra_secreta"]
	@@ahorcado.set_key_word(secret_word)
	show_game(initial_qty_failed_chars)
end

get "/jugar" do
	@@ahorcado.play_with_char(params["letra"])
	if (@@ahorcado.is_winner || @@ahorcado.is_loser)
		show_result
	else
		show_game(@@ahorcado.get_qty_failed_chars)
	end
end

def show_game(qty_failed_chars)
	@word_displayed=@@ahorcado.get_hidden_word
	@qty_failed_chars=qty_failed_chars
	@formatted_failed_chars=@@ahorcado.get_formatted_failed_chars
	erb :jugar
end

def show_result
	if(@@ahorcado.is_winner)
		@result="GANO"
	end
	if(@@ahorcado.is_loser)
		@result="PERDIO"
	end
	@secret_word=@@ahorcado.format_key_word
	erb :resultado
end


