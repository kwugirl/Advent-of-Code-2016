require 'digest'

def interesting_hash?(str)
  str[0..4] == "00000"
end

def hashed_string(str)
  Digest::MD5.hexdigest(str)
end

def construct_password_in_order(input)
  password = []
  i = 0

  while password.length < 8
    hashed_string = hashed_string("#{input}#{i}")
    password << hashed_string[5] if interesting_hash?(hashed_string)
    i += 1
  end

  password.join
end

# Part A
# puts construct_password_in_order('cxdnnyjw')

###############################

# Part B
