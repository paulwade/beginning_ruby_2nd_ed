# Using %w is the same as this:
# stopwords = ['the', 'a', 'by', ...]
stopwords = %w{the a by on for of are with just but and to the my I has some in}

# Using %q is the same as this:
# text = "Lost Angeles has..."
text = %q{Los Angeles has some of the finest weather in the country}

# This breaks up the text variable into an array of words
words = text.scan(/\w+/)

# The #select method returns elements from an array that match the condition in
# the block.  In this case, the condition is that the word being passed in is
# NOT included in the array of stop words.
keywords = words.select { |word| !stopwords.include?(word) }

puts keywords.join(' ')

