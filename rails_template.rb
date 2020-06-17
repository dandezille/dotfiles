gem_group :development, :test do
  gem 'awesome_print'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

run 'bundle install'
generate 'rspec:install'

insert_into_file 'spec/rails_helper.rb',
                 "Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }\n",
                 after: "# Add additional requires below this line. Rails is not loaded until this point!\n"

create_file 'spec/support/factory_bot.rb',
            'RSpec.configure { |config| config.include FactoryBot::Syntax::Methods }'

create_file 'spec/factories.rb', ''

create_file 'spec/factories_spec.rb',
            <<-EOL
require 'rails_helper'

RSpec.describe FactoryBot do
  it { FactoryBot.lint traits: true }
end
EOL
