# frozen_string_literal: true
if `uname` =~ /Darwin/
  notification :terminal_notifier, app_name: 'Vector Tests::'
  notification :tmux,
    display_message: true,
    timeout: 2, # in seconds
    default_message_format: '%s >> %s',
    # the first %s will show the title, the second the message
    # Alternately you can also configure *success_message_format*,
    # *pending_message_format*, *failed_message_format*
    line_separator: ' > ', # since we are single line we need a separator
    color_location: 'status-left-bg', # to customize which tmux element will change color

    # Other options:
    default_message_color: 'black',
    success: 'colour150',
    failure: 'colour174',
    pending: 'colour179',

    # Notify on all tmux clients
    display_on_all_clients: false
else
  notification :libnotify, title: 'Vector Tests::'
end

clearing :on

guard :bundler do
  require 'guard/bundler'
  require 'guard/bundler/verify'
  helper = Guard::Bundler::Verify.new

  files = ['Gemfile']
  files += Dir['*.gemspec'] if files.any? { |f| helper.uses_gemspec?(f) }

  # Assume files are symlinked from somewhere
  files.each { |file| watch(helper.real_path(file)) }
end

guard 'rspec', cmd: 'bundle exec rspec' do
  # watch /lib/ files
  watch(%r{^lib/(.+).rb$}) do |m|
    "spec/#{m[1]}_spec.rb"
  end

  # watch /spec/ files
  watch(%r{^spec/(.+).rb$}) do |m|
    "spec/#{m[1]}.rb"
  end
end
