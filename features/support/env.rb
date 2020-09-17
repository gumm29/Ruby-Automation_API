require 'httparty'
require 'pry'
require_relative 'commons'

MASSA = yaml('/data/massa.yml')
CONFIG = yaml('/config/config.yml')