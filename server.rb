require "sinatra"

require_relative "#{Dir.pwd}/routes/orders.rb"

class NorthwindServer
    attr_accessor :port, :server

    # include Sinatra::Templates
    # include Sinatra::Helpers
    # include Sinatra::ContentFor

    def initialize(port)
        @@port = port

        server_config
        load_routes
    end

    def run!
        @@server.run!
    end

    def shutdown
        @@server.quit!
    end

    private
    def load_routes
        @@server.get '/' do
            # binding.pry
            erb :default_index
        end

        @@server.post '/orders' do
            request.body.rewind  # in case someone already read it
            reqBody = JSON.parse request.body.read
            action = reqBody['action']

            case action.downcase
                
            when 'update'
                Routes::Orders.update(request) # Check self obj
            when 'insert'
                Routes::Orders.insert(request) # Check self obj
            else
                erb :default_error
            end
        end

        @@server.error Sinatra::NotFound do
            redirect to ('/')
        end

        @@server.error 400..510 do 
            redirect to ('/')
        end
    end

    def server_config
        @@server = Sinatra::Base

        @@server.before do
            headers "Server" => ''
            headers "Access-Control-Allow-Origin" => '*'
        end

        @@server.bind = '0.0.0.0'
        @@server.port = @@port
        @@server.mime_type :json
        @@server.mime_type :plain
        @@server.dump_errors = false
        @@server.raise_errors = false
        @@server.show_exceptions = false
        @@server.views = "#{Dir.pwd}/public/views"
        @@server.public_folder = "#{Dir.pwd}/public"
    end
end