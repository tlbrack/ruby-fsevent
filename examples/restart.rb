$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../ext')
require 'fsevent'

class Restart < FSEvent
  def on_change(directories)
    puts "Detected change in: #{directories.inspect}"
    unless @restarted
      self.stop
      @restarted = true
      self.watch_directories "#{Dir.pwd}/spec"
      self.start
    end
  end

  def start
    puts "watching #{registered_directories.join(", ")} for changes"
    super
  end
end

Signal.trap("INT"){ puts 'hi int'}

restarter = Restart.new
restarter.watch_directories "#{Dir.pwd}/examples"
restarter.start