Gem::Specification.new do |s|
  s.name        = 'rbsso'
  s.version     = '0.2.1'
  s.licenses    = ['MIT']
  s.summary     = "Ruby implementation for ai's libsso"
  s.description = <<-EODESC
This is a ruby version based on libsodium of "ai sso"(https://git.autistici.org/ai/sso).

We provide an omniauth strategy. It could also be used in bonafide server to sign sso tickets to be consumed by soledad server.
  EODESC
  s.authors     = ['Azul']
  s.email       = 'azul@riseup.net'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'https://0xacab.org/riseup/rbsso'
  s.add_dependency 'rbnacl', '>= 3.4.0', '< 5.0'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'minitest-autotest', '~> 1.0'
  s.add_development_dependency 'autotest-suffix', '~> 1.1'
  s.add_development_dependency 'simplecov', '~> 0.11'
  s.add_development_dependency 'conventional-changelog', '~> 1.2'
end
