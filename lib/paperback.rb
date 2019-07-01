# typed: strict
require 'logger'
require 'sorbet-runtime'

# Paperback is a library for creating paper backups of sensitive data.
module Paperback
  extend T::Sig

  @log = T.let(nil, T.nilable(Logger))

  sig {returns(Logger)}
  def self.log
    return @log if @log
    @log = Logger.new(STDERR)
    @log.progname = self.name
    @log.level = log_level
    @log
  end

  sig {params(klass: Class, stream: IO).returns(Logger)}
  def self.class_log(klass, stream=STDERR)
    log = Logger.new(stream)
    log.progname = klass.name
    log.level = log_level
    log
  end

  @log_level = T.let(nil, T.nilable(Integer))

  sig {returns(Integer)}
  def self.log_level
    @log_level ||= Logger::INFO
  end

  sig {params(val: Integer).returns(Integer)}
  def self.log_level=(val)
    @log_level = val
  end
end

require_relative 'paperback/version'
require_relative 'paperback/cli'
require_relative 'paperback/document'
require_relative 'paperback/preparer'
