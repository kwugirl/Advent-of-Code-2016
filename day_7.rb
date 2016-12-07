def has_an_abba?(str)
  characters = str.split("")
  second_to_last_index = characters.length - 2

  (2..second_to_last_index).each do |i|
    if characters[i] == characters[i-1] &&
      characters[i] != characters[i+1] &&
      characters[i+1] == characters[i-2]

      return true
    end
  end

  false
end
