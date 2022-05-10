class Cipher

  @@downcase = [*'a'..'z']
  @@upcase = [*'A'..'Z']
 
  def encode(string, shift)
    coded = code(string, shift, true)
    display(string, coded, shift)
  end

  def decode(string, shift)
    coded = code(string, shift, false)
    display(string, coded, shift)
  end

  
  private

  def code(string, shift, encode)

    shift *= -1 unless encode

    string.chars.map do |char|
      case char
      when 'a'..'z'
        @@downcase[(@@downcase.index(char) + shift) % 26]
      when 'A'..'Z'
        @@upcase[(@@upcase.index(char) + shift) % 26]
      else
        char
      end
    end.join('')

  end

  def display(orig, coded, shift)
    puts "Original string: #{orig}"
    puts "Encoded string : #{coded}"
    puts "With offset    : #{shift}"
  end

end

c = Cipher.new
puts c.encode('abcde', 3)
puts c.decode('defgh', 3)
puts c.encode('This should stay the same', 26)
puts c.encode('ab9c.d#', 5)
puts c.encode('R!ub00y r!ub00y r!ub00y r!ub00y ...', 5)