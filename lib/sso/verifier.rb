require 'rbnacl'
require 'base64'

module SSO
  class Verifier

    def initialize(verifier_key)
      @key = RbNaCl::VerifyKey.new Base64.decode64(verifier_key)
    end

    def open(ticket)
      decoded = Base64.urlsafe_decode64 ticket
      signature = decoded[0..63]
      content = decoded[64..-1]
      return content if key.verify(signature, content)
    end

    protected
    attr_reader :key
  end
end
