require_relative "#{Dir.pwd}/models/product.rb"

class Routes
    class Products
        def self.getAll(request)
            # request.body.rewind
            # reqBody = JSON.parse request.body.read

            ## For DBG
            prdList = []                ## For DBG
            for i in 0..9 do            ## For DBG
                hProd = Product.new     ## For DBG
                prdList << hProd        ## For DBG
            end                         ## For DBG
            return prdList              ## For DBG
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


