require 'tiny_tds'

require_relative "#{Dir.pwd}/models/customer.rb"

class Routes
    class Customers
        def self.getAll(request)
            customerList = []
            queryResult = Database.executeQuery("SELECT * FROM Customers")            
            queryResult.each do |row|
                customerList << Customer.new(row)
            end
            return customerList
        end

        def self.getOne(request)
            customerID = request.params[:customerID]

            query = "select * from Customers where Customers.CustomerID = '#{customerID}'"

            queryResult = Database.executeQuery(query)
            oneCustomer = Customer.new(queryResult.first)
            return oneCustomer
        end
        
        def self.update(request)
            request.body.rewind
            reqBody = JSON.parse request.body.read
            "Update #{reqBody['data']}!"

            query = "" ## TODO ver a query de update

            queryResult = Database.executeQuery(query)
            oneCustomer = Customer.new(queryResult.first)
            return oneCustomer
        end

        def self.delete(request)
            request.body.rewind
            reqBody = JSON.parse request.body.read
            "delete #{reqBody['data']}!"

            query = "" ## TODO ver a query de update

            queryResult = Database.executeQuery(query)
            oneCustomer = Customer.new(queryResult.first)
            return oneCustomer
        end
    
        def self.insert(request)
            request.body.rewind
            reqBody = JSON.parse request.body.read
            "Insert #{reqBody['data']}!"

            query = "" ## TODO ver a query de update

            queryResult = Database.executeQuery(query)
            oneCustomer = Customer.new(queryResult.first)
            return oneCustomer
        end
    end
end


