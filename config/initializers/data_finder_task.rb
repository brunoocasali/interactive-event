require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '2m' do
  begin
    Event.will_happen.each do |event|
      Search::Base.new(event).start_finder!
    end
  rescue => e
    $stderr.puts '-' * 80
    $stderr.puts e.message
    $stderr.puts e.stacktrace
    $stderr.puts '-' * 80
  end
end

scheduler.every '5s' do
  Rails.logger.info '--------------------------*****-------- WORKS'
end
