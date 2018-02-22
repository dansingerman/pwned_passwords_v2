require "pwned_passwords_v2/version"
require "digest"
require "open-uri"

module PwnedPasswordsV2
  def have_i?(password)
    sha1_hash = Digest::SHA1.hexdigest(password)

    begin
      response = open("https://api.pwnedpasswords.com/range/#{sha1_hash.first(5)}")
      puts response
    rescue

    end
  end
end
