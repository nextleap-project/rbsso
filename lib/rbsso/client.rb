require 'rbnacl'
require 'rbsso/ticket'
require 'rbsso/authentication'

module RbSSO
  class Client
    class TicketExpired < RuntimeError
      def initialize(expiry)
        super "Expired #{Time.now.to_i - expiry} seconds ago."
      end
    end

    class WrongService < RuntimeError
      def initialize(expected, was)
        super "Ticket issued for #{was} is not valid on #{expected}."
      end
    end

    class NonceMismatch < RuntimeError
      def initialize(expected, was)
        super "Ticket nonce '#{was}' differs from session nonce '#{expected}'."
      end
    end

    def initialize(service, key)
      if !key || key !~ /[0-9a-f]{64}/i
        raise ArgumentError, "key MUST be 32 bytes, hex encoded string, was: #{key}"
      end
      @service = service
      key = RbNaCl::VerifyKey.new [key].pack('H*')
      @verify_key = key
    end

    def open(ticket_string, nonce: nil)
      ticket = RbSSO::Ticket.open ticket_string, verify_key
      auth = RbSSO::Authentication.parse ticket.content
      raise TicketExpired.new(auth.expires) if auth.expired?
      raise WrongService.new(service, auth.service) if auth.service != service
      raise NonceMismatch.new(nonce, auth.nonce) if auth.nonce != nonce
      auth.to_info
    end

    protected
    attr_reader :verify_key, :service
  end
end
