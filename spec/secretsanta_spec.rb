require 'spec_helper'

describe SecretSanta do
  before :each do
    party = %w(John Joe Jack Jan Jill Jim)
    hat = party.shuffle
  end

  it "should shuffle the party" do
    PARTY.should_receive(:shuffle).once
    the_hat.should_not == PARTY

    SecretSanta.run
  end

  it "should have everyone pick a name" do
    SecretSanta.should_receive(:everyone_pick_a_name).with(PARTY,the_hat).once

    SecretSanta.run
  end

  it "should redo if the receiver is santa" do
    pending "work on this"

    SecretSanta.stub(:get_name).and_return("John")
    party.each do |p|
      p.should_not == "John"
    end

    SecretSanta.everyone_pick_a_name(party,hat)
  end

  it "should pair everybody up" do
    SecretSanta.should_receive(:pair_them_up).exactly(:six).times

    SecretSanta.everyone_pick_a_name(party,hat)
  end

  context "santa is not the receiver" do
    it "should pair" do
      SecretSanta.stub(:get_receiver).and_return("Sally")
      santa = "John"

      SecretSanta.should_receive(:set_arrangement).once

      SecretSanta.pair_them_up(santa)
    end

  end

  context "santa is the receiver" do
    it "should not allow" do
      SecretSanta.stub(:get_receiver).and_return("John")
      santa = "John"

      SecretSanta.should_not_receive(:set_arrangement)

      SecretSanta.pair_them_up(santa)
    end
  end

  it "should return an arrangement" do
    santa = "John"
    receiver = "Sally"

    canned_result = {:santa => 'John', :receiver => 'Sally'}
    SecretSanta.set_arrangement(santa,receiver).should == canned_result
  end

end
