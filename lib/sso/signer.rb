require 'rbnacl'
require 'base64'


module SSO

  class Signer

    def initialize(seed = nil)
      if !seed || seed !~ /[0-9a-f]{64}/i
        raise ArgumentError, "seed MUST be 32 bytes, hex encoded string"
      end
      seed_binary = [seed].pack('H*')
      @key = RbNaCl::SigningKey.new seed_binary
    end

    def verify_key
      Base64.encode64 @key.verify_key.to_s
    end

    def sign(ticket)
      @key.sign(ticket.to_s)
    end
  end

end
