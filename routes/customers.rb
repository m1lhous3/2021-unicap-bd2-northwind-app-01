require_relative "#{Dir.pwd}/models/customer.rb"

class Routes
    class Customers
        def self.getAll(request)
            # request.body.rewind
            # reqBody = JSON.parse request.body.read

            ## For DBG
            ctmList = []                ## For DBG
            for i in 0..9 do            ## For DBG
                hCtm = Customer.new     ## For DBG
                ctmList << hCtm         ## For DBG
            end                         ## For DBG
            return ctmList              ## For DBG
            ## End                      ## For DBG
        end

        def self.getOne(request)
            
        end
        
        def self.update(request)
            request.body.rewind
            reqBody = JSON.parse request.body.read
            "Update #{reqBody['data']}!"
        end
    
        def self.insert(request)
            request.body.rewind
            reqBody = JSON.parse request.body.read
            "Insert #{reqBody['data']}!"
        end
    end
end


