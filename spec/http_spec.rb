require 'helper'

Hobby::Devtools::RSpec.describe do
  app do
    Class.new do
      include Hobby
      include Hobby::JSON
      get { json }
    end.new
  end
  path 'spec/http/*.yml'
end
