require 'sso/signer'
require 'sso/ticket'
require 'base64'

module SSO
  class Server

    def initialize(secret)
      @signer = SSO::Signer.new(secret)
    end

    def ticket(user, service, domain)
      ticket = SSO::Ticket.new user: user, service: service, domain: domain
      signatur = signer.sign ticket
      return Base64.urlsafe_encode64(signatur + ticket.to_s)
    end

    def verifier_key
      signer.verify_key
    end

    protected

    attr_reader :signer
  end
end
