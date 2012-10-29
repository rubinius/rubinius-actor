require File.expand_path('../spec_helper', __FILE__)

describe "Rubinius::Actor.unlink" do
  it "sends an exit message to linked Rubinius::Actors" do
    actor = Rubinius::Actor.spawn(Rubinius::Actor.current) do |master|
      Rubinius::Actor.link(master)

      Rubinius::Actor.receive do |f|
        f.when(:ping) { Rubinius::Actor.unlink(master) }
      end

      raise "foo"
    end

    actor.send :ping
    msg = Rubinius::Actor.receive do |f|
      f.after(0) do end
    end

    msg.should == nil
  end
end
