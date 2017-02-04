require 'rbnacl'
require 'rbsso/ticket'
require 'rbsso/authentication'

module RbSSO
  class Server

    def initialize(secret)
      if !secret || secret !~ /[0-9a-f]{64}/i
        raise ArgumentError, "seed MUST be 32 bytes, hex encoded string"
      end
      seed_binary = [secret].pack('H*')
      @key = RbNaCl::SigningKey.new seed_binary
    end

    # Create a ticket based on the authentication options.
    #
    # minimal example:
    #   sso_server.ticket user: username, service: service, domain: domain
    #
    # Other options:
    #   nonce: nonce identifying the client session. Send to server in params.
    #   ttl:   time to live - number of seconds until the ticket expires.
    def ticket(auth_options = {})
      auth = RbSSO::Authentication.new auth_options
      ticket = RbSSO::Ticket.sign auth, key
      return ticket.to_base64
    end

    def verify_key
      key.verify_key.to_s.unpack('H*').first
    end

    protected

    attr_reader :key
  end
end
