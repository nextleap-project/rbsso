require 'sso/verifier'
require 'sso/ticket'

module SSO
  class Client

    def initialize(key)
      @verifier = SSO::Verifier.new key
    end

    def open(ticket_string)
      content = verifier.open ticket_string
      ticket = SSO::Ticket.parse content
      return ticket.user + '@' + ticket.domain
    end

    protected
    attr_reader :verifier
  end
end
