require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '2m' do
  begin
    Event.will_happen.each do |event|
      Search::Base.new(event).start_finder!
    end

    rescue e
      Rails.logger.info "--------------------------*****-------- ERROS #{e}"
  end
end

scheduler.every '5s' do
  Rails.logger.info '--------------------------*****-------- WORKS'
end
