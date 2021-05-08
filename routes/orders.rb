class Routes
    class Orders
        def self.update(request)
            request.body.rewind
            reqBody = JSON.parse request.body.read
            "Update #{reqBody['data']}!"
        end
    
        def self.insert(request)
            request.body.rewind
            reqBody = JSON.parse request.body.read
            "insert #{reqBody['data']}!"
        end
    end
end