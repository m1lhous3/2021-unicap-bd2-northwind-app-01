class Routes
    class Orders
        def self.getAll(request)
            request.body.rewind
            reqBody = JSON.parse request.body.read
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