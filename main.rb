#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "glass"
require "xmlrpc/client"
require "io/console"

case ARGV.first
when "login"
  $stdout.write "server: "
  server = $stdin.gets.chomp!

  $stdout.write "user: "
  user = $stdin.gets.chomp!

  $stdout.write "password: "
  password = $stdin.getpass

  c = XMLRPC::Client.new2(server)
  c.http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  res = c.call2("session.login_with_password", user, password)
  pp res
end

