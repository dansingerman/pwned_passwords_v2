require "pwned_passwords_v2/version"
require "digest"
require "open-uri"

module PwnedPasswordsV2
  def self.have_i?(password)
    sha1_hash = Digest::SHA1.hexdigest(password).upcase
    sha1_hash_prefix = sha1_hash[0..4]

    response = open("https://api.pwnedpasswords.com/range/#{sha1_hash_prefix}").read

    sha1_hash_prefix_matches = response.split(/\r?\n/)

    if sha1_hash_prefix_matches.size == 0
      raise "No sha1 prefix matches returned from https://api.pwnedpasswords.com. The service is probably broken."
    end

    sha1_hash_prefix_matches.each_with_index do |sha1_hash_prefix_match, line|
      unless sha1_hash_prefix_match.strip[/\b[0-9A-F]{35}:[0-9]+$\b/]
        raise "Unexpected response format in line #{line + 1} - #{sha1_hash_prefix_match}"
      end

      sha1_hash_suffix = sha1_hash_prefix_match.split(':')[0]

      return sha1_hash_prefix_match.split(':')[1].to_i if "#{sha1_hash_prefix}#{sha1_hash_suffix}" == sha1_hash
    end

    return 0
  end
end
