require 'pathname'
require 'sqlite3'
require 'active_record'
require 'logger'

APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

APP_NAME = APP_ROOT.basename.to_s

DB_PATH  = APP_ROOT.join('db', APP_NAME + ".db").to_s

if ENV['DEBUG']
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

require_relative '../app/controllers/controller'
require_relative '../app/models/dealer'
require_relative '../app/models/deck'
require_relative '../app/models/card'
require_relative '../app/models/player'
require_relative '../app/models/hand'
ActiveRecord::Base.establish_connection :adapter  => 'sqlite3', :database => DB_PATH
