class Routes
    class Reports
        def self.getAll(request)
            productList = []
            queryResult = Database.executeQuery("SELECT * FROM Products")
            queryResult.each do |row|
                productList << Product.new(row)
            end
            return productList
        end

        def self.getOne(request)
            orderID = request.params[:productID]

            query = "select * from Products where Products.ProductID = #{orderID}"

            queryResult = Database.executeQuery(query)
            oneProduct = Product.new(queryResult.first)
            return oneProduct
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
