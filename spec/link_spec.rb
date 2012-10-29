require File.expand_path('../spec_helper', __FILE__)

describe "Rubinius::Actor.link" do
  it "sends an exit message to linked Rubinius::Actors" do
    pending "To be fixed"
    master = Rubinius::Actor.current
    chan = Rubinius::Channel.new

    a = Rubinius::Actor.spawn do
      Rubinius::Actor.trap_exit = true
      msg = Rubinius::Actor.receive
      chan.send msg
    end

    b = Rubinius::Actor.spawn(Rubinius::Actor.current) do |master|
      Rubinius::Actor.trap_exit = true
      Rubinius::Actor.link(master)
      Rubinius::Actor.link(a)

      raise "foo"
    end

    msgs = []
    msgs << Rubinius::Actor.receive
    msgs << chan.receive

    msgs[0][0].should == :exit
    msgs[1][0].should == :exit
  end
end
