class FizzBuzz

  def self.run
    (1..100).each do |num|
      puts determine_response(num)
    end
  end

  def self.determine_response(num)
    txt = ''
    txt = 'Fizz' if num%3==0
    txt += 'Buzz' if num%5==0

    txt.empty? ? num : txt
  end
end
