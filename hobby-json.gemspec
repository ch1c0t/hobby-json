Gem::Specification.new do |g|
  g.name    = 'hobby-json'
  g.files   = `git ls-files`.split($/)
  g.version = '0.0.5'
  g.summary = 'A Hobby extension for JSON requests and responses.'
  g.authors = ['Anatoly Chernow']

  g.add_dependency 'rack'
end
