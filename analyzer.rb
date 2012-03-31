stopwords = %w{the a by on for of are with just but and to the my I has some in}


lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

# count the characters
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length

# count the words, sentences, and paragraphs
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

# Figure out how many words are not stop-words as a % of total words
all_words = text.scan(/\w+/)
good_words = all_words.select{ |word| !stopwords.include?(word) }

good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

# Summarize the text by picking out the good sentences
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
ideal_sentences_in_order = sentences.select { |sentence| ideal_sentences.include?(sentence) }

puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{good_words.length} good words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{good_percentage}% of words are non-fluff words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- Fin --"

