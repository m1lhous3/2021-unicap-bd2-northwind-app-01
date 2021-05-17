require 'tiny_tds'

require_relative "#{Dir.pwd}/models/order.rb"

class Routes
    class Orders
        def self.getAll(request)

            query = "select * from Orders join [Order Details] as od on Orders.OrderID = od.OrderID join Products as pdc on od.ProductID = pdc.ProductID"

            arrOrderList = []
            productList = []

            productKeys = [:ProductID, :UnitPrice, :Quantity, :Discount, :ProductName, :SupplierID, :CategoryID, :QuantityPerUnit, :UnitsInStock, :UnitsOnOrder, :ReorderLevel, :Discontinued]

            queryResult = Database.executeQuery(query)
            queryResult.each do |row|
                hProduct = row.select { |key,_| productKeys.include? key }
                row = Hash[row.to_a - hProduct.to_a] #Go Horse to clear hash
                objProdcut = Product.new(hProduct)
                hProduct = {:OrderID => row[:OrderID], :Product => objProdcut}
                productList << hProduct
                arrOrderList << row unless arrOrderList.include? row
            end

            orderList = []
            arrOrderList.each do |order|
                orderList << Order.new(order)
            end

            orderList.each do |order|
                productList.select do |productByOrder|
                    if productByOrder[:OrderID] == order.OrderID
                        order.ProductList << productByOrder[:Product]
                    end
                end
            end
            return orderList
        end

        def self.getOne(request)
            orderID = request.params[:orderID]

            query = "select * from Orders join [Order Details] as od on Orders.OrderID = od.OrderID join Products as pdc on od.ProductID = pdc.ProductID where Orders.OrderID = #{orderID}"

            orderList = []
            productList = []

            productKeys = [:ProductID, :UnitPrice, :Quantity, :Discount, :ProductName, :SupplierID, :CategoryID, :QuantityPerUnit, :UnitsInStock, :UnitsOnOrder, :ReorderLevel, :Discontinued]

            queryResult = Database.executeQuery(query)
            queryResult.each do |row|
                hProduct = row.select { |key,_| productKeys.include? key }
                row = Hash[row.to_a - hProduct.to_a] #Go Horse to clear hash
                objProdcut = Product.new(hProduct)
                hProduct = {:OrderID => row[:OrderID], :Product => objProdcut}
                productList << hProduct
                orderList << Order.new(row)
            end

            orderList.each do |order|
                productList.each do |productByOrder|
                    if productByOrder[:OrderID] == order.OrderID
                        order.ProductList << productByOrder[:Product]
                        productList.delete(productByOrder)
                    end
                end
            end
            return orderList
        end
        
        def self.update(request)
            request.body.rewind
            reqBody = JSON.parse(request.body.read, :symbolize_names => true)
        end
    
        def self.insert(request)
            request.body.rewind
            reqBody = JSON.parse(request.body.read, :symbolize_names => true)
        end
    end
end