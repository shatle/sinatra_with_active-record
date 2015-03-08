ENV['RACK_ENV'] = 'test'

$LOAD_PATH.unshift(File.dirname(__FILE__), '..')
require 'app'
require "minitest/autorun"
include ResponseHelper
Dir[File.dirname(__FILE__) + '/test/*.rb'].each {|file| require file }