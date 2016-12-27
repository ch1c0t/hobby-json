Gem::Specification.new do |g|
  g.name    = 'hobby-json'
  g.files   = `git ls-files`.split($/)
  g.version = '0.0.4'
  g.summary = 'A way to work with JSON in Hobby without too much verbosity.'
  g.authors = ['Anatoly Chernow']

  g.add_dependency 'rack'
end
