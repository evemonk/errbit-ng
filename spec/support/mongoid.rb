# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    Mongoid::Config.truncate!
  end
end
