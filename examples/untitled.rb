require 'rubinius/actor'

Ready = Struct.new(:this)
Work = Struct.new(:msg)

@supervisor = Rubinius::Actor.spawn do
  supervisor = Rubinius::Actor.current
  work_loop = Proc.new do
    loop do
      work = Rubinius::Actor.receive
      puts("Processing: #{work.msg}")
      supervisor << Ready[Rubinius::Actor.current]
    end
  end

  Rubinius::Actor.trap_exit = true
  ready_workers = []
  10.times do |x|
    # start 10 worker actors
    ready_workers << Rubinius::Actor.spawn_link(&work_loop)
  end
  loop do
    Rubinius::Actor.receive do |f|
      f.when(Ready) do |who|
        # SNIP
      end
      f.when(Work) do |work|
        ready_workers.pop << work
      end
      f.when(Rubinius::Actor::DeadActorError) do |exit|
        print "Actor exited with message: #{exit.reason}\n"
        ready_workers << Rubinius::Actor.spawn_link(&work_loop)
      end
    end
  end
end

10.times do |idx|
  @supervisor << Work[idx]
end
sleep 1