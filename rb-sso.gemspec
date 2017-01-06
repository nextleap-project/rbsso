Gem::Specification.new do |s|
  s.name        = 'rb-sso'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = "Ruby implementation for ai's libsso"
  s.description = <<-EODESC
This is a ruby version based on libsodium of "ai sso"(https://git.autistici.org/ai/sso).

For now it is meant to be used in to integrate with the bonafide server to sign sso tickets to be consumed by soledad server.

It could also be used in an omniauth_aisso strategy to use the tickets to authenticate to omniauth enabled rails apps such as gitlab or helpy.
  EODESC
  s.authors     = ['Azul']
  s.email       = 'azul@riseup.net'
  s.files       = ['lib/sso.rb', 'lib/sso/ticket.rb']
  s.homepage    = 'https://0xacab.org/azul/rb-sso'
  s.add_dependency 'rbnacl'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
end
