require File.expand_path('../spec_helper', __FILE__)

describe "Rubinius::Actor registration" do
  it "stores actors by identifier" do
    actor = Rubinius::Actor.spawn(Rubinius::Actor.current) do |master|
      Rubinius::Actor[:foo] = Rubinius::Actor.current
      msg = Rubinius::Actor.receive
      master.send msg

      master.send Rubinius::Actor.receive
    end

    actor.send "phase1"
    Rubinius::Actor.receive.should == "phase1"

    # We know that the actor is now between phases, so the registeration
    # must be visible by now.
    Rubinius::Actor[:foo].should == actor

    actor.send "phase2"
    Rubinius::Actor.receive.should == "phase2"

    Rubinius::Actor[:foo] = nil
    Rubinius::Actor[:foo].should == nil
  end
end
