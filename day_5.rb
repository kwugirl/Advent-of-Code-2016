require 'digest'

def interesting_hash?(str)
  Digest::MD5.hexdigest(str)[0..4] == "00000"
end

