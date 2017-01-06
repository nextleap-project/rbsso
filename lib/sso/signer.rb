require 'rbnacl'
require 'base64'


module SSO

  class Signer

    def initialize(seed = nil)
      @key = RbNaCl::SigningKey.generate
    end

    def verify_key
      Base64.encode64 @key.verify_key.to_s
    end

    def sign(ticket)
      @key.sign(ticket.to_s)
    end
  end

end
