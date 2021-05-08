require 'sinatra'
require 'erb'
# require_relative "#{Dir.pwd}/erbRender.rb"

class Routes
    class Orders
        def self.update(request)
            request.body.rewind  # in case someone already read it
            reqBody = JSON.parse request.body.read
            "Update #{reqBody['data']}!"
        end
    
        def self.insert(request)
            request.body.rewind  # in case someone already read it
            reqBody = JSON.parse request.body.read
            "insert #{reqBody['data']}!"
        end
    end
end