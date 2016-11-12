require 'json'

module Hobby
  module JSON
    def self.included app
      app.use Rack::ContentType, 'application/json'
      app.response.extend Write
    end

    module Write
      def write object
        super object.to_json
      end
    end

    def json
      @json ||= JSON.parse request.body.read
    end
  end
end
