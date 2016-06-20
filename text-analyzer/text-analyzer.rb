lines = File.readlines(ARGV[0])
stopwords = %w{the a by on for of are with just but and to the my I has some in}
line_count = lines.size
text = lines.join
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length
total_words = text.split.length
total_sentences = text.split(/\.|\?|!/).length
total_paragraphs = text.split(/\n\n/).length
keywords = text.split.select { |word| !stopwords.include?(word) }


puts "#{ line_count } lines"
puts "#{ total_characters } characters"
puts "#{ total_characters_nospaces } charecters excluding spaces"
puts "#{ total_words } words"
puts "#{ total_sentences } sentences"
puts "#{ total_paragraphs } paragraphs"
puts "#{ total_sentences / total_paragraphs } sentences per paragraph (average)"
puts "#{ total_words / total_sentences } words per sentence (average)"
# puts "interesting keywords: #{ keywords.join(" ") }"
puts "#{((keywords.length.to_f / total_words.to_f) * 100).to_i}% of non-stop words"
