module SSO
  class Ticket
    VERSION = 3

    attr_reader :user, :service, :domain, :groups, :expires

    def initialize(user:, service:, domain:, groups: [], ttl: 3600, expires: nil)
      @user, @service, @domain, @groups = user, service, domain, groups
      @expires = expires || (Time.now + ttl).to_i
    end

    def self.parse(string)
      version, user, service, domain, expires, groups = string.split '|'
      groups ||= ''
      groups = groups.split ','
      expires = expires.to_i
      new user: user, service: service, domain: domain, expires: expires, groups: groups
    end

    def to_s
      content.join '|'
    end

    def content
      [VERSION, user, service, domain, expires.to_s, groups.join(',')]
    end

    def ==(other)
      user == other.user &&
        service == other.service &&
        domain == other.domain &&
        groups == other.groups &&
        expires == other.expires
    end

  end
end
