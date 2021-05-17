require "sinatra"

require_relative "#{Dir.pwd}/routes/orders.rb"
require_relative "#{Dir.pwd}/routes/products.rb"
require_relative "#{Dir.pwd}/routes/customers.rb"

class NorthwindServer
    attr_accessor :port, :server

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
            erb :default_index
        end

        @@server.get '/products' do
            @allProducts = Routes::Products.getAll(request)
            erb :all_products
        end

        @@server.get '/products/:productID' do
            @oneProduct = Routes::Products.getOne(self)
            erb :one_product
        end

        @@server.get '/customers' do
            @allCustomers = Routes::Customers.getAll(request)
            erb :all_customers
        end

        @@server.get '/customers/:customerID' do
            @oneCustomer = Routes::Customers.getOne(self)
            erb :one_customer
        end

        @@server.post '/customers/:customerID' do
            request.body.rewind
            reqBody = JSON.parse request.body.read
            action = reqBody['action']

            case action.downcase
            when 'update'
                Routes::Customers.update(request)
            when 'delete'
                Routes::Customers.delete(request)
            when 'insert'
                Routes::Customers.insert(request)

            else
                erb :default_error
            end
        end

        @@server.get '/orders' do
            @allOrders = Routes::Orders.getAll(request)
            erb :all_orders
        end

        @@server.get '/orders/:orderID' do
            @oneOrder = Routes::Orders.getOne(self)
            erb :one_order
        end

        @@server.post '/orders' do
            request.body.rewind
            reqBody = JSON.parse request.body.read
            action = reqBody['action']

            case action.downcase
            when 'update'
                Routes::Orders.update(request)
            when 'insert'
                Routes::Orders.insert(request)

            else
                erb :default_error
            end
        end

        @@server.error 400..510 do 
            erb :default_error
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