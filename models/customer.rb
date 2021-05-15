### Example
#
#
###

require 'json'

class Customer
    attr_accessor :customerID, :companyName, :contactName, :contactTitle, :address, :region, :postalCode, :country, :phone, :fax
    def initialize(params = {})
        @customerID = params.fetch(:productID, rand(-999999..0))
        @companyName = params.fetch(:productName, "Lorem Ipsum Company Name #{Time.now}")
        @contactName = params.fetch(:supplierID, "Lorem Ipsum Contact Name #{Time.now}")
        @contactTitle = params.fetch(:categoryID, "Lorem Ipsum Contact Title #{Time.now}")
        @address = params.fetch(:quantityPerUnit, "Lorem Ipsum Address #{Time.now}")
        @region = params.fetch(:unitPrice, "")
        @postalCode = params.fetch(:unitsInStock, "")
        @country = params.fetch(:unitsOnOrder, "")
        @phone = params.fetch(:reorderLevel, "")
        @fax = params.fetch(:discontinued, "")
    end

    def to_json
        { 
            :customerID => @customerID,
            :companyName => @companyName,
            :contactName => @contactName,
            :contactTitle => @contactTitle,
            :address => @address,
            :region => @region,
            :postalCode => @postalCode,
            :country => @country,
            :phone => @phone,
            :fax => @fax
        }
    end
end