Class.new do
  include Hobby::App
  include Hobby::JSON
  get { json }
end.new
