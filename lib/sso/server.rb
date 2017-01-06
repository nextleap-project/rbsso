require 'sso/signer'
require 'sso/ticket'

module SSO
  class Server

    def initialize(secret)
      @signer = SSO::Signer.new(secret)
    end

    def ticket(user, service, domain)
      ticket = SSO::Ticket.new user: user, service: service, domain: domain
      signatur = signer.sign ticket
      return signatur + ticket.to_s
    end

    protected

    attr_reader :signer
  end
end
