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
def construct_password_with_positioning(input)
  password = Array.new(8,nil)
  i = 0
  valid_positions = (0..7).to_a.map {|i| i.to_s }

  while password.include?(nil)
    hashed_string = hashed_string("#{input}#{i}")

    if interesting_hash?(hashed_string)
      pos = hashed_string[5]

      if valid_positions.include?(pos) && password[pos.to_i].nil?
        password[pos.to_i] = hashed_string[6]
      end
    end

    i += 1
  end

  password.join
end

# puts construct_password_with_positioning('cxdnnyjw')
