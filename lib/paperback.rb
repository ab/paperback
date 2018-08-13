require 'logger'

# Paperback is a library for creating paper backups of sensitive data.
module Paperback
  def self.log
    return @log if @log
    @log = Logger.new(STDERR)
    @log.progname = self.name
    @log.level = log_level
    @log
  end

  def self.class_log(klass, stream=STDERR)
    log = Logger.new(stream)
    log.progname = klass.name
    log.level = log_level
    log
  end

  def self.log_level
    return @log_level if @log_level

    @log_level = Logger::INFO
  end

  def self.log_level=(val)
    @log_level = val
  end
end

require_relative 'paperback/version'
require_relative 'paperback/document'
require_relative 'paperback/preparer'
