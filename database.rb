require "sinatra"

class Database
    attr_accessor :client

    def initialize(params = {})
        @@client = TinyTds::Client.new username: params[:Username], password: params[:Password], host: params[:Host], database: params[:DatabaseName]
        @@client.query_options[:symbolize_keys] = true
    end

    def self.executeQuery(query)
        retQuery = @@client.execute(query)
        return retQuery
    end
end