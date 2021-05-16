require 'bundler/setup'
# require 'NorthwindServer'
require 'sinatra'
require 'json'
require 'yaml'
require 'base64'
require 'tiny_tds'
# require 'data_mapper'

require_relative 'server.rb'
require_relative 'database.rb'

## For dbg mode
require 'pry'
# DataMapper::Logger.new($stdout, :debug)

class NorthwindMain
    attr_accessor :server, :database, :bash

    def initialize(params = {})
        initialize_directories

        # TODO-fga: Integrate with DB
        # @@database = Database.new(params.fetch(:Database, {}))
        @@server = NorthwindServer.new(params.fetch(:ServerPort, 8080))
        @@database = Database.new()
    end

    def init_server
        @@server.run!
    end

    def init_database
        @@database.run!
    end

    def server_shutdown
        @@server.shutdown
    end

    private
    def initialize_directories
        private_dir = "#{Dir.pwd}/Private"
        [private_dir, 
            "#{private_dir}/Logs",
            "#{private_dir}/Database"].each { |dir| Dir.mkdir(dir) unless Dir.exist?(dir) }
    end
end

config = YAML.load_file('config/config.yml')

ntwServer = NorthwindMain.new(config)
ntwServer.init_database
# ntwServer.init_server

ntwServer.server_shutdown