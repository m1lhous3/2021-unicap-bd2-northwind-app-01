require 'tiny_tds'  

class Database

    attr_accessor :client
    
    def run!
        config = YAML.load_file('config/config.yml')
        client = TinyTds::Client.new username: config[:Database][:Username], password: config[:Database][:Password], host: config[:Database][:Host], database: config[:Database][:DatabaseName], port: config[:Database][:DatabasePort]
    end
end