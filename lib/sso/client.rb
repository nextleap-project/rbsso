require 'sso/verifier'
require 'sso/content'

module SSO
  class Client

    def initialize(key)
      @verifier = SSO::Verifier.new key
    end

    def open(ticket_string)
      content_string = verifier.open ticket_string
      content = SSO::Content.parse content_string
      { name: content.user, email: content.user + '@' + content.domain }
    end

    protected
    attr_reader :verifier
  end
end
