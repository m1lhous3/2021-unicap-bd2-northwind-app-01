require "sinatra"

require_relative "#{Dir.pwd}/routes/orders.rb"
require_relative "#{Dir.pwd}/routes/reports.rb"
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

        @@server.get '/report' do
            @allOrdersReports = Routes::Reports.getOrdersReport(request)
            erb :report
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

        @@server.get '/edit/customers/:customerID' do
            @oneCustomer = Routes::Customers.getOne(self)
            erb :edit_customer
        end

        @@server.post '/edit/customers/:customerID' do
            Routes::Customers.update(request)
            redirect '/customers/update/success'
        end

        @@server.get '/insert/customers' do
            erb :insert_customer
        end

        @@server.post '/insert/customers' do
            Routes::Customers.insert(request)
            redirect '/customers/insert/success'
        end

        @@server.get '/delete/customers/:customerID' do
            Routes::Customers.delete(self)
            erb :success_customer_delete
        end

        @@server.get '/customers/update/success' do
            erb :success_customer_update
        end

        @@server.get '/customers/insert/success' do
            erb :success_customer_insert
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