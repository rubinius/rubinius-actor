require File.expand_path('../spec_helper', __FILE__)

describe "Rubinius::Actor#trap_exit" do
  it "accesses the trap_exit flag for the current actor" do
    sync = Rubinius::Channel.new
    Rubinius::Actor.spawn do
      begin
        Rubinius::Actor.trap_exit?.should be_false
        Rubinius::Actor.trap_exit.should be_false
        Rubinius::Actor.trap_exit = true
        Rubinius::Actor.trap_exit?.should be_true
        Rubinius::Actor.trap_exit.should be_true
        Rubinius::Actor.trap_exit = false
        Rubinius::Actor.trap_exit?.should be_false
        Rubinius::Actor.trap_exit.should be_false
      rescue Exception => e 
        sync << e
      ensure
        sync << nil
      end
    end
    ex = sync.receive
    raise ex if ex
  end
end
