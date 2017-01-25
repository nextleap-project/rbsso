module TestData
  def expired_content
    "4|user|service|domain|#{Time.now.to_i - 1000}|"
  end

  def current_content
    "4|user|service|domain|#{Time.now.to_i}|"
  end

  def current_content_with_nonce
    "4|user|service|domain|#{Time.now.to_i}|nonce|"
  end

  def signing_key
    seed_binary = [seed].pack('H*')
    RbNaCl::SigningKey.new seed_binary
  end

  def verify_key
    signing_key.verify_key
  end

  def verify_key_hex
    verify_key.to_s.unpack('H*').first
  end

  def seed
    '1234567890ABCDEF' * 4
  end

  def current_ticket_string
    RbSSO::Ticket.sign(current_content, signing_key).to_base64
  end

  def expired_ticket_string
    RbSSO::Ticket.sign(expired_content, signing_key).to_base64
  end

  def current_ticket_with_nonce_string
    RbSSO::Ticket.sign(current_content_with_nonce, signing_key).to_base64
  end

  # This is outdated content but we continue to use it to
  # test the signing and base64 encoding of the tickets.

  def static_content
    '3|user|service|domain|1483964492|'
  end

  def static_ticket_string
    "loFbFifM6T_WJfe8D9Jyr80KXWxnBYNeJUoUA2PiSZi-Q_zSbFNu6gI-ujcDHTOq90GivY5nngTDz94C4zpgDjN8dXNlcnxzZXJ2aWNlfGRvbWFpbnwxNDgzOTY0NDkyfA=="
  end

end
