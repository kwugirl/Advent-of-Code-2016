def decompress(compressed)
  decompressed = []

  compressed.split("").each do |letter|
    decompressed << letter
  end

  decompressed.join
end
