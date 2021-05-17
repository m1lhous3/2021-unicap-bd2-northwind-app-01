### Example
#
#
###

require 'json'

class Customer
    attr_accessor :CustomerID, :CompanyName, :ContactName, :ContactTitle, :Address, :City, :Region, :PostalCode, :Country, :Phone, :Fax
    def initialize(params = {})
        @CustomerID = params.fetch(:CustomerID, rand(-999999..0))
        @CompanyName = params.fetch(:CompanyName, "Lorem Ipsum Company Name #{Time.now.to_s}")
        @ContactName = params.fetch(:ContactName, "Lorem Ipsum Contact Name #{Time.now.to_s}")
        @ContactTitle = params.fetch(:ContactTitle, "Lorem Ipsum Contact Title #{Time.now.to_s}")
        @Address = params.fetch(:Address, "Lorem Ipsum Address #{Time.now.to_s}")
        @City = params.fetch(:City, "Lorem Ipsum City #{Time.now.to_s}")
        @Region = params.fetch(:Region, "Lorem Ipsum Region #{Time.now.to_s}")
        @PostalCode = params.fetch(:PostalCode, "Lorem Ipsum PostalCode #{Time.now.to_s}")
        @Country = params.fetch(:Country, "Lorem Ipsum Country #{Time.now.to_s}")
        @Phone = params.fetch(:Phone, "Lorem Ipsum Phone #{Time.now.to_s}")
        @Fax = params.fetch(:Fax, "Lorem Ipsum Fax #{Time.now.to_s}")
    end

    {:CustomerID=>"ALFKI",
        :CompanyName=>"Alfreds Futterkiste",
        :ContactName=>"Maria Anders",
        :ContactTitle=>"Sales Representative",
        :Address=>"Obere Str. 57",
        :City=>"Berlin",
        :Region=>nil,
        :PostalCode=>"12209",
        :Country=>"Germany",
        :Phone=>"030-0074321",
        :Fax=>"030-0076545"}

    def to_json
        { 
            :CustomerID => @CustomerID,
            :CompanyName => @CompanyName,
            :ContactName => @ContactName,
            :ContactTitle => @ContactTitle,
            :Address => @Address,
            :City => @City,
            :Region => @Region,
            :PostalCode => @PostalCode,
            :Country => @Country,
            :Phone => @Phone,
            :Fax => @Fax
        }
    end
end