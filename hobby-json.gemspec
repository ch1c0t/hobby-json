Gem::Specification.new do |g|
  g.name    = 'hobby-json'
  g.files   = `git ls-files`.split($/)
  g.version = '0.0.6'
  g.summary = 'A Hobby extension for JSON requests and responses.'
  g.authors = ['Anatoly Chernov']

  g.add_dependency 'hobby', '~> 0.2.2'
end
