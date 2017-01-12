require 'rbsso/content'
require 'rbsso/ticket'

module RbSSO
  class Server

    def initialize(secret)
      if !secret || secret !~ /[0-9a-f]{64}/i
        raise ArgumentError, "seed MUST be 32 bytes, hex encoded string"
      end
      seed_binary = [secret].pack('H*')
      @key = RbNaCl::SigningKey.new seed_binary
    end

    def ticket(user, service, domain)
      content = RbSSO::Content.new user: user, service: service, domain: domain
      ticket = RbSSO::Ticket.sign content, key
      return ticket.to_base64
    end

    def verify_key
      key.verify_key.to_s.unpack('H*').first
    end

    protected

    attr_reader :key
  end
end
