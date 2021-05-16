### Example
#
# prodParams = { :productID => 1234 }
# hProd = Product.new(prodParams)
# hProd.productName
# jProd = hProd.to_json
# jProd[:productID]
#
###

require 'json'

class Product
    attr_accessor :productID, :productName, :supplierID, :categoryID, :quantityPerUnit, :unitPrice, :unitsInStock, :unitsOnOrder, :reorderLevel, :discontinued
    def initialize(params = {})
        @productID = params.fetch(:productID, rand(-999999..0))
        @productName = params.fetch(:productName, "Lorem Ipsum #{@productID}")
        @supplierID = params.fetch(:supplierID, rand(-999999..0))
        @categoryID = params.fetch(:categoryID, rand(-999999..0))
        @quantityPerUnit = params.fetch(:quantityPerUnit, ["10 boxes x 20 bags", "24 - 12 oz bottles", "12 - 550 ml bottles", "48 - 6 oz jars", "36 boxes", "18 - 500 g pkgs.", "50 bags x 30 sausgs.", "16 pies", "15 - 300 g rounds"].shuffle.first)
        @unitPrice = params.fetch(:unitPrice, rand.round(2) + rand(0..20))
        @unitsInStock = params.fetch(:unitsInStock, rand(0..200))
        @unitsOnOrder = params.fetch(:unitsOnOrder, 0)
        @reorderLevel = params.fetch(:reorderLevel, 0)
        @discontinued = params.fetch(:discontinued, 0)
    end

    def to_json
        { 
            :productID =>  @productID,
            :productName => @productName,
            :supplierID => @supplierID,
            :categoryID => @categoryID,
            :quantityPerUnit => @quantityPerUnit,
            :unitPrice => @unitPrice,
            :unitsInStock => @unitsInStock,
            :unitsOnOrder => @unitsOnOrder,
            :reorderLevel => @reorderLevel,
            :discontinued => @discontinued
        }
    end
end