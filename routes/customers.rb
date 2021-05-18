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
            reqBody = JSON.parse(request.body.read, :symbolize_names => true)

            customer = Customer.new(reqBody)

            query = "UPDATE Customers SET CompanyName='#{customer.CompanyName}', ContactName='#{customer.ContactName}', ContactTitle='#{customer.ContactTitle}', Address='#{customer.Address}', City='#{customer.City}', Region='#{customer.Region}', PostalCode='#{customer.PostalCode}', Country='#{customer.Country}', Phone='#{customer.Phone}', Fax='#{customer.Fax}' WHERE CustomerID='#{customer.CustomerID}'"

            queryResult = Database.executeQuery(query)
        end

        def self.delete(request)
            query = "DELETE FROM Customers WHERE CustomerID='#{request.params["customerID"]}'"

            queryResult = Database.executeQuery(query)
        end
    
        def self.insert(request)
            request.body.rewind
            reqBody = JSON.parse(request.body.read, :symbolize_names => true)
            customer = Customer.new(reqBody)

            query = "INSERT INTO Customers (CustomerID,CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax) VALUES ('#{customer.CustomerID}','#{customer.CompanyName}', '#{customer.ContactName}', '#{customer.ContactTitle}', '#{customer.Address}', '#{customer.City}', '#{customer.Region}', '#{customer.PostalCode}', '#{customer.Country}', '#{customer.Phone}', '#{customer.Fax}')"
            queryResult = Database.executeQuery(query)
        end
    end
end


