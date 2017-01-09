require 'sso/signer'
require 'sso/content'
require 'base64'

module SSO
  class Server

    def initialize(secret)
      @signer = SSO::Signer.new(secret)
    end

    def ticket(user, service, domain)
      content = SSO::Content.new user: user, service: service, domain: domain
      signatur = signer.sign content
      return Base64.urlsafe_encode64(signatur + content.to_s)
    end

    def verifier_key
      signer.verify_key
    end

    protected

    attr_reader :signer
  end
end
