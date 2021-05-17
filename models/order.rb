### Example
#
#
###

require 'date'
require 'json'

class Order
    attr_accessor :OrderID, :CustomerID, :EmployeeID, :OrderDate, :RequiredDate, :ShippedDate, :ShipVia, :Freight, :ShipName, :ShipAddress, :ShipCity, :ShipRegion, :ShipPostalCode, :ShipCountry, :ProductList
    def initialize(params = {})
        @OrderID = params.fetch(:OrderID, rand(-999999..0))
        @CustomerID = params.fetch(:CustomerID, rand(-999999..0))
        @EmployeeID = params.fetch(:EmployeeID, rand(-999999..0))
        @OrderDate = params.fetch(:OrderDate, Date.parse(Time.now.to_s))
        @RequiredDate = params.fetch(:RequiredDate, Date.parse(Time.now.to_s))
        @ShippedDate = params.fetch(:ShippedDate, Date.parse(Time.now.to_s))
        @ShipVia = params.fetch(:ShipVia, "Lorem Ypsum #{Time.now}")
        @Freight = params.fetch(:Freight, rand(0..200))
        @ShipName = params.fetch(:ShipName, "Lorem Ypsum Ship Name #{Time.now}")
        @ShipAddress = params.fetch(:ShipAddress, "Lorem Ypsum Ship Address #{Time.now}")
        @ShipCity = params.fetch(:ShipCity, "Lorem Ypsum Ship City #{Time.now}")
        @ShipRegion = params.fetch(:ShipRegion,  "Lorem Ypsum Ship Region #{Time.now}")
        @ShipPostalCode = params.fetch(:ShipPostalCode,  "Lorem Ypsum Ship PostalCode #{Time.now}")
        @ShipCountry = params.fetch(:ShipCountry,  "Lorem Ypsum Ship Country #{Time.now}")
        @ProductList = params.fetch(:ProductList, [])
    end

    def to_json
        { 
            :OrderID => @OrderID,
            :CustomerID => @CustomerID,
            :EmployeeID => @EmployeeID,
            :OrderDate => @OrderDate,
            :ShippedDate => @ShippedDate,
            :ShipVia => @ShipVia,
            :Freight => @Freight,
            :ShipName => @ShipName,
            :ShipAddress => @ShipAddress,
            :ShipCity => @ShipCity,
            :ShipRegion => @ShipRegion,
            :ShipPostalCode => @ShipPostalCode,
            :ShipCountry => @ShipCountry,
            :ProductList => @ProductList
        }
    end
end