require 'pry'

class PigLatinizer

	def starts_with_vowel?(word)
		vowels = %w[a e i o u A E I O U]
		vowels.include?(word[0]) ? true : false
	end

	def move_first_consonants(word)
		dwn_consonants = %w[b c d f g h j k l m n p q r s t v w x y z]
		up_consonants = dwn_consonants.collect {|x| x.upcase}
		all_consonants = dwn_consonants + up_consonants

		word = word.split("")
		first_consonants = word.take_while{|x| all_consonants.include?(x) }
		word.shift(first_consonants.count)
		word << first_consonants
		word.flatten.join("")
	end

	def add_way(word)
		word << "way"
	end

	def add_ay(word)
		word << "ay"
	end

	def to_pig_latin(string)
		string.split.collect do |word| 
			piglatinize(word)
		end.join(" ")
	end

	def piglatinize(word)
		if starts_with_vowel?(word)
			add_way(word)
		else
			add_ay(move_first_consonants(word))
		end
	end

end

# phrase = "Thrusted cow licks are another word for love"

# new_phrase = PigLatinizer.new

# p new_phrase.to_pig_latin(phrase)
# binding.pry