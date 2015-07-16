web: bundle exec passenger start -p $PORT --max-pool-size 3 && bundle exec clockwork lib/clock.rb
worker: rake jobs:work
clock: bundle exec clockwork lib/clock.rb
