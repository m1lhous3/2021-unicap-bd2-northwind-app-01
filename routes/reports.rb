class Routes
    class Reports
        def self.getOrdersReport(request)
            reportList = []
            query = "EXEC report_orders"
            queryResult = Database.executeQuery(query)
            
            queryResult.each do |row|
                reportList << row
            end
            return reportList
        end
    end
end
