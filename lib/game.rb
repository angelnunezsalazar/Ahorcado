class Ahorcado
		
		attr_reader :key_word
		
		def set_key_word(key)
			@key_word = key.upcase
			@chars = @key_word.split('')
			@hidden_chars = @key_word.split('')
			@trials_with_char = 0
			@failed_chars = Array.new
			for index in (1..@key_word.length-2) do
				reset_hidden_chars("_",index)
			end
		end

		def reset_hidden_chars(char, index)
			@hidden_chars[index] = char;				
		end

		def get_hidden_word()
			return @hidden_chars.join(" ")
		end
		
		def process_failed_char(char)
			if (@failed_chars.index(char) == nil)		
				@failed_chars.push(char)
			end	
		end
		
		def try_as_failed_char(char)
			if (@chars.index(char) == nil)
				process_failed_char(char)
			end
		end
		
		def try_as_valid_char(char)		
			for index in (1..@key_word.length-2) do
				if (@chars[index] == char)
					reset_hidden_chars(char, index)
        end
			end
		end
		
		
		def play_with_char(char)
		  char_upper = char.upcase
		  @trials_with_char += 1
			try_as_valid_char(char_upper)
			try_as_failed_char(char_upper)
		end
		
		def play_with_word(word)
		
		end
		
		
		def get_failed_chars()
			return @failed_chars
		end
		
		def get_formatted_failed_chars()
			result = "Ninguna"
		  if (@failed_chars.length>0)
		  	result = @failed_chars.join(',')
		  end
		  return result
		end
		
		def get_qty_failed_chars()
			return @failed_chars.length
		end
		
		def is_winner()
		  win = true
			for index in (0..@key_word.length-1) do
			  win = win && (@hidden_chars[index] ==  @chars[index])
			end
			return win
		end
		
		def is_loser()
			return 	(get_qty_failed_chars() == 6);
		end
		
		def format_key_word()
			return @key_word.split("").join(" ")
		end
end
