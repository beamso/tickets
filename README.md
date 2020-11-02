# Tickets 

## installing ruby - assuming macOS
I have developed this using Ruby 2.7.2. It should be possible to edit `.ruby-version`, changing 2.7.2 to whatever ruby version that you have installed on your machine (find it using `ruby --version`) and go from there.

I have followed the following steps:
* install [Homebrew](https://brew.sh/)
* install [rbenv](https://github.com/rbenv/rbenv) and [ruby-build](https://github.com/rbenv/ruby-build) - `brew install rbenv ruby-build`
* install Ruby 2.7.2 - `rbenv install 2.7.2`

## installing testing dependencies
* `gem install bundler`, if [Bundler](https://bundler.io) is not installed.
* `bundle install` - to install dependencies
* `bundle exec rake` - to run [RuboCop](https://github.com/rubocop-hq/rubocop) and [RSpec](https://rspec.info/)
* `bundle exec rubocop` - to run just RuboCop
* `bundle exec rspec` - to run just RSpec

## suggested usage, as per the documentation
* `ruby ./search_tool.rb -keys users` - can substitute users for `tickets` and `organizations`
* `ruby ./search_tool.rb -search users _id 71`
* `ruby ./search_tool.rb -search organizations _id 123`
* `ruby ./search_tool.rb -search tickets assignee_id 64`
* `ruby ./search_tool.rb -search users verified ""` - sample command to search for an empty/nil attribute

## what is potentially lazy
* files are hard coded and being read from the root directory of the project
  * to change the code to run any larger files that you run as part of the code assessment, you'll have to change `lib/search_tool_impl.rb#initialize` as the file names are hard coded there.
* no differentiation between the empty string and a missing attribute
