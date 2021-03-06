# Setup and install gems
gem 'clearance'
gem 'dotenv-rails'

gem_group :development, :test do
  gem 'awesome_print'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

gem_group :test do
  gem 'capybara'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
end

run 'bundle install'

# Install and configure rspec
generate 'rspec:install'

insert_into_file 'spec/rails_helper.rb',
                 "Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |file| require file }\n",
                 after: "# Add additional requires below this line. Rails is not loaded until this point!\n"

# Configure FactoryBot

create_file 'spec/support/factory_bot.rb',
            'RSpec.configure { |config| config.include FactoryBot::Syntax::Methods }'

create_file 'spec/factories.rb', ''

create_file 'spec/factories_spec.rb', <<-EOL
require 'rails_helper'

RSpec.describe FactoryBot do
  it { FactoryBot.lint traits: true }
end
EOL

# Configure capybara

insert_into_file 'spec/rails_helper.rb',
                 "require 'capybara/rspec'\n",
                 after: "# Add additional requires below this line. Rails is not loaded until this point!\n"

# Configure Shoulda Matchers
create_file 'spec/support/shoulda_matchers.rb', <<-EOL
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
EOL

# Install and configure clearance
rails_command 'db:create'
generate 'clearance:install'
rails_command 'db:migrate'

create_file 'app/views/layouts/_header.html.erb', <<-EOL
<div id="header"> 
  <% if signed_in? %>
    Signed in as: <%= current_user.email %>
    <%= button_to 'Sign out', sign_out_path, method: :delete %>
  <% else %>
    <%= link_to 'Sign in', sign_in_path %>
  <% end %> 
</div>
EOL

create_file 'app/views/layouts/_flash.html.erb', <<-EOL
<div id="flash"> 
  <% flash.each do |key, value| %>
    <div class="flash <%= key %>"><%= value %></div>
  <% end %>
</div>
EOL

layout_elements = <<-EOL
    <%= render partial: 'layouts/flash' %>
    <%= render partial: 'layouts/header' %>
EOL

insert_into_file 'app/views/layouts/application.html.erb',
                 layout_elements,
                 after: "<body>\n"

environment <<-EOL
    # Generate full URLs in emails   
    config.action_mailer.default_url_options = { host: ENV['HOST_NAME'] }

EOL

clearance_test_middleware = <<-EOL
  # Use auth backdoor in tests
  config.middleware.use Clearance::BackDoor 

EOL

environment clearance_test_middleware, env: 'test'
    
# Configure environment variables
create_file '.env', <<-EOL
HOST_NAME=localhost:3000
EOL

