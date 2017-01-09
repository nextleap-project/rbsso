require 'rbnacl'
require 'sso/ticket'
require 'sso/content'

module SSO
  class Client

    def initialize(key)
      if !key || key !~ /[0-9a-f]{64}/i
        raise ArgumentError, "key MUST be 32 bytes, hex encoded string, was: #{key}"
      end
      key = RbNaCl::VerifyKey.new [key].pack('H*')
      @verify_key = key
    end

    def open(ticket_string)
      ticket = SSO::Ticket.open ticket_string, verify_key
      content = SSO::Content.parse ticket.content
      content.to_info
    end

    protected
    attr_reader :verify_key
  end
end
