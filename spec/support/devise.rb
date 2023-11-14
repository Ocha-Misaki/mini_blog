RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.before :suite do
    Warden.test_mode!
  end
  config.include Devise::Test::ControllerHelpers, type: :controller
end
