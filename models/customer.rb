### Example
#
#
###

require 'json'

class Customer
    attr_accessor :customerID, :companyName, :contactName, :contactTitle, :address, :region, :postalCode, :country, :phone, :fax
    def initialize(params = {})
        @customerID = params.fetch(:productID, rand(-999999..0))
        @companyName = params.fetch(:companyName, "Lorem Ipsum Company Name #{Time.now.to_s}")
        @contactName = params.fetch(:contactName, "Lorem Ipsum Contact Name #{Time.now.to_s}")
        @contactTitle = params.fetch(:contactTitle, "Lorem Ipsum Contact Title #{Time.now.to_s}")
        @address = params.fetch(:address, "Lorem Ipsum Address #{Time.now.to_s}")
        @region = params.fetch(:region, "Lorem Ipsum region #{Time.now.to_s}")
        @postalCode = params.fetch(:postalCode, "Lorem Ipsum postalCode #{Time.now.to_s}")
        @country = params.fetch(:country, "Lorem Ipsum country #{Time.now.to_s}")
        @phone = params.fetch(:phone, "Lorem Ipsum phone #{Time.now.to_s}")
        @fax = params.fetch(:fax, "Lorem Ipsum fax #{Time.now.to_s}")
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