ENV['RAILS_ENV'] ||= 'test'

if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
else
  require 'simplecov'

  SimpleCov.configure do
    coverage_dir File.join('.', 'tmp', 'code_analysis', 'coverage')
  end

  SimpleCov.start 'rails'
end

require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'awesome_print'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Loading forgeries from a custom path
Forgery.load_from! "#{Forgery.rails_root}/spec/support/forgery"

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

# Include Warden::Test::Helpers is necessary to call the login_as method here inside spec helper file
include Warden::Test::Helpers
Warden.test_mode!

Capybara.default_wait_time = 5

Capybara.javascript_driver = :poltergeist

# Keep up to the number of screenshots specified in the hash
# Capybara::Screenshot.prune_strategy = { keep: 20 }

RSpec.configure do |config|
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each, js: true) { DatabaseCleaner.strategy = :truncation }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }

  # Remove verbose methods from this hot girl
  config.include FactoryGirl::Syntax::Methods

  # Include Devise methods to the specs
  config.include Devise::TestHelpers, type: :controller


  config.before(:each, type: :controller) do
    @current_user = FactoryGirl.create(:user)
    login_as @current_user
  end

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Raise any error when dreprected function was found
  config.raise_errors_for_deprecations!
end

