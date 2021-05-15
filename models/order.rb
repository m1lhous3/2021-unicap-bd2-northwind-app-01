### Example
#
#
###

require 'date'
require 'json'

class Order
    attr_accessor :orderID, :customerID, :employeeID, :orderDate, :shippedDate, :shipVia, :freight, :shipName, :shipAddress, :shipCity, :shipRegion, :shipPostalCode, :shipCountry, :productsDetails
    def initialize(params = {})
        @orderID = params.fetch(:orderID, rand(-999999..0))
        @customerID = params.fetch(:customerID, rand(-999999..0))
        @employeeID = params.fetch(:employeeID, rand(-999999..0))
        @orderDate = params.fetch(Date.parse(:orderDate), Date.parse(Time.now.to_s))
        @shippedDate = params.fetch(Date.parse(:shippedDate), Date.parse(Time.now.to_s))
        @shipVia = params.fetch(:shipVia, "Lorem Ypsum #{Time.now}")
        @freight = params.fetch(:freight, rand(0..200))
        @shipName = params.fetch(:shipName, "Lorem Ypsum Ship Name #{Time.now}")
        @shipAddress = params.fetch(:shipAddress, "Lorem Ypsum Ship Address #{Time.now}")
        @shipCity = params.fetch(:shipCity, "Lorem Ypsum Ship City #{Time.now}")
        @shipRegion = params.fetch(:shipRegion,  "Lorem Ypsum Ship Region #{Time.now}"))
        @shipPostalCode = params.fetch(:shipPostalCode,  "Lorem Ypsum Ship PostalCode #{Time.now}"))
        @shipCountry = params.fetch(:shipCountry,  "Lorem Ypsum Ship Country #{Time.now}"))
        @productsDetails = params.fetch(:productsDetails, [{:productID => 0, :unitPrice => 0, :quantity => 0, :discount => 0}])
    end

    def to_json
        { 
            :orderID => @orderID,
            :customerID => @customerID,
            :employeeID => @employeeID,
            :orderDate => @orderDate,
            :shippedDate => @shippedDate,
            :shipVia => @shipVia,
            :freight => @freight,
            :shipName => @shipName,
            :shipAddress => @shipAddress,
            :shipCity => @shipCity,
            :shipRegion => @shipRegion,
            :shipPostalCode => @shipPostalCode,
            :shipCountry => @shipCountry,
            :productsDetails => @productsDetails
        }
    end
end