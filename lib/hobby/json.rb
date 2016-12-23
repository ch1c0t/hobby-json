require 'json'
require 'rack'

module Hobby
  module JSON
    def self.included app
      app.use Rack::ContentType, 'application/json'
      app.response = Response
    end

    class Response < Rack::Response
      def write object
        super object.to_json
      end
    end

    def json
      @json ||= begin
                  ::JSON.parse request.body.read
                rescue
                  response.status = 400
                end
    end
  end
end
