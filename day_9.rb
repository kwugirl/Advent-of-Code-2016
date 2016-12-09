require 'pry'

def decompress(compressed)
  decompressed = ""

  while compressed.length > 0
    pre_marker = compressed[/[^(]*/]
    decompressed << pre_marker

    rest_of_string = compressed[pre_marker.length..-1]

    if rest_of_string.length > 0
      pieces = rest_of_string.match(/^\((\d+)x(\d+)\)(.+)/)
      rep_length = pieces[1].to_i
      rep_count = pieces[2].to_i
      rest_of_string = pieces[3].split("")

      rep = rest_of_string.shift(rep_length)
      rep_count.times { decompressed << rep.join }

      compressed = rest_of_string.join
    else
      break
    end
  end

  decompressed
end
