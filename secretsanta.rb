class SecretSanta
  PARTY = %w(Larry Curley Moe Shemp Howard Joe)

  def self.run
    the_hat = PARTY.shuffle
    everyone_pick_a_name(PARTY,the_hat)
  end

private

  def self.everyone_pick_a_name(the_party,the_hat)
    the_party.map do |santa|
      receiver = get_name(the_hat)
      receiver == santa ? redo : the_hat.delete(receiver)
      set_arrangement(santa,receiver)
    end
  end

  def self.get_name(the_hat)
    the_hat[0 + rand(the_hat.size)]
  end

  def self.set_arrangement(santa,receiver)
    puts "#{receiver}'s secret santa is #{santa}"
    {:santa => santa, :receiver => receiver}
  end

end

SecretSanta.run
