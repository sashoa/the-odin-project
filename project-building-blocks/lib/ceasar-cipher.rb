puts 'Input text to encrypt'
sen = gets.chomp
puts 'Input the shift factor'
fac = gets.chomp.to_i

def caps_check(i)
  if ('A'..'Z') === i
    return 1
  elsif ('a'..'z') === i
    return 2
  else return 3
  end
end

def ceasar_cipher(sentence, shift_factor)
  big = ('A'..'Z').to_a
  small = ('a'..'z').to_a
  i = 0
  while i < sentence.length
    if caps_check(sentence[i]) == 1
      j = big.index(sentence[i])
    elsif caps_check(sentence[i]) == 2
      j = small.index(sentence[i])
    end
    if caps_check(sentence[i]) != 3
      shift_factor.times do
        j += 1
        j = 0 if j == 26
      end
      if caps_check(sentence[i]) == 2
        sentence[i] = small[j]
        i += 1
        j = small.index(sentence[i])
      else
        sentence[i] = big[j]
        i += 1
        j = big.index(sentence[i])
      end
    else
      i += 1
    end
  end
  sentence
end

ceasar_cipher(sen, fac)
puts sen
