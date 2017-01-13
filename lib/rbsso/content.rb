module RbSSO
  class Content
    VERSION = 3

    class VersionMismatch < ArgumentError
      def initialize(version)
        super "Version mismatch! Expected: #{VERSION} Got: #{version}."
      end
    end

    attr_reader :user, :service, :domain, :groups, :expires

    def initialize(user:, service:, domain:, groups: [], ttl: 3600, expires: nil)
      @user, @service, @domain, @groups = user, service, domain, groups
      @expires = expires || (Time.now + ttl).to_i
    end

    def self.parse(string)
      version, user, service, domain, expires, groups = string.split '|'
      check_version(version)
      new user: user,
        service: service,
        domain: domain,
        expires: expires.to_i,
        groups: (groups || '').split(',')
    end

    def to_s
      content.join '|'
    end

    def to_info
      { name: user, email: user + '@' + domain }
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

    def expired?
      self.expires < Time.now.to_i
    end

    def self.check_version(version)
      return if version.to_s == VERSION.to_s
      raise VersionMismatch.new(version)
    end
  end
end
