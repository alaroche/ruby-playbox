class FizzBuzz

  def self.run
    (1..100).each do |num|
      txt = ''
      txt = 'Fizz' if num%3==0
      txt += 'Buzz' if num%5==0

      puts (txt.empty? ? num : txt)
    end
  end

end
