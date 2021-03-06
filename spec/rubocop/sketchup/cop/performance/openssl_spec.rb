# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::SketchupPerformance::OpenSSL do

  subject(:cop) { described_class.new }

  it 'registers an offense for use of OpenSSL' do
    expect_offense(<<-RUBY.strip_indent)
      require "openssl"
      ^^^^^^^^^^^^^^^^^ Avoid use of OpenSSL within SketchUp due to severe performance issues.
    RUBY
  end

  it 'registers an offense for use of SecureRandom' do
    expect_offense(<<-RUBY.strip_indent)
      require "securerandom"
      ^^^^^^^^^^^^^^^^^^^^^^ Avoid use of OpenSSL within SketchUp due to severe performance issues.
    RUBY
  end

  it 'registers an offense for use of Net::HTTPS' do
    expect_offense(<<-RUBY.strip_indent)
      require "net/https"
      ^^^^^^^^^^^^^^^^^^^ Avoid use of OpenSSL within SketchUp due to severe performance issues.
    RUBY
  end

  it 'registers an offense for use of Net::HTTP' do
    expect_offense(<<-RUBY.strip_indent)
      require "net/http"
      ^^^^^^^^^^^^^^^^^^ Avoid use of OpenSSL within SketchUp due to severe performance issues.
    RUBY
  end

  it 'does not register an offense for other modules' do
    expect_no_offenses(<<-RUBY.strip_indent)
      require "json"
    RUBY
  end

  it 'does not register an offense for non-string literals' do
    expect_no_offenses(<<-RUBY.strip_indent)
      require filename
    RUBY
  end

end
