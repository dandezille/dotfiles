# Setup and install gems
gem 'clearance'

gem_group :development, :test do
  gem 'awesome_print'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
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

insert_into_file 'app/views/layouts/application.html.erb',
                 "    <%= render partial: 'layouts/flash' %>\n",
                 after: "<body>\n"

insert_into_file 'app/views/layouts/application.html.erb',
                 "    <%= render partial: 'layouts/header' %>\n",
                 after: "<body>\n"
