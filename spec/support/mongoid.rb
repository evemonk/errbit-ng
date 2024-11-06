Mongoid::Config.truncate!
Mongoid::Tasks::Database.create_indexes

RSpec.configure do |config|
  config.before(:each) do
    Mongoid::Config.truncate!
  end
end
