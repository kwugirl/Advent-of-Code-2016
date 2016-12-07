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

def supports_tls?(str)
  pieces = str.match /^(.+)\[(.+)\](.+$)/

  pre_brackets = pieces[1]
  hypernet_seq = pieces[2]
  post_brackets = pieces[3]

  !has_an_abba?(hypernet_seq) && (has_an_abba?(pre_brackets) || has_an_abba?(post_brackets))
end
