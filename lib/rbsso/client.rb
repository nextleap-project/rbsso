require 'rbnacl'
require 'rbsso/ticket'
require 'rbsso/content'

module RbSSO
  class Client

    def initialize(service, key)
      if !key || key !~ /[0-9a-f]{64}/i
        raise ArgumentError, "key MUST be 32 bytes, hex encoded string, was: #{key}"
      end
      @service = service
      key = RbNaCl::VerifyKey.new [key].pack('H*')
      @verify_key = key
    end

    def open(ticket_string)
      ticket = RbSSO::Ticket.open ticket_string, verify_key
      content = RbSSO::Content.parse ticket.content
      if content.service != service
        raise RuntimeError.new("Wrong service in ticket: #{content.service}")
      end
      content.to_info
    end

    protected
    attr_reader :verify_key, :service
  end
end
