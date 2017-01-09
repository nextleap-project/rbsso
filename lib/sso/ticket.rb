require 'base64'

module SSO
  class Ticket
    attr_reader :content, :signature

    def self.sign(content, key)
      new content, key.sign(content), key.verify_key
    end

    def self.open(encoded, verify_key)
      decoded = Base64.urlsafe_decode64 encoded
      new decoded[64..-1], decoded[0..63], verify_key
    end

    def initialize(content, signature, verify_key)
      verify_key.verify(signature, content)
      @content = content
      @signature = signature
    end

    def to_base64
      Base64.urlsafe_encode64(signature + content)
    end
  end
end
