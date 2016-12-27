require 'helper'

Hobby::Devtools::RSpec.describe do
  app do
    Class.new do
      include Hobby
      include Hobby::JSON
      get { json }
      get('/access_key') { json['key'] }
    end.new
  end
end
