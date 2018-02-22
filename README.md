# PwnedPasswordsV2

This gem is a simple wrapper to Troy Hunt's https://api.pwnedpasswords.com service to check if a password has been found in a data breach.

See https://www.troyhunt.com/ive-just-launched-pwned-passwords-version-2/ for more details.

## Note

The code is kept deliberately simple so you can eyeball what is going on.

The passwords you use in this gem do not get sent externally. The password is sha1 hashed, and then only the first 5 characters are sent externally.

Troy Hunt's [blog post](https://www.troyhunt.com/ive-just-launched-pwned-passwords-version-2/) explains this process in more detail.

If you like this gem please donate to Troy's [donations page](https://haveibeenpwned.com/Donate)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pwned_passwords_v2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pwned_passwords_v2

## Usage

You can find out the number of times a password has appeared in Troy Hunt's Pwned Passwords V2 dataset as follows.


```>  PwnedPasswordsV2.have_i?('password')
=> 3303003
>  PwnedPasswordsV2.have_i?('a_nice_strong_password+%^&*()__*')
=> 0
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dansingerman/pwned_passwords_v2.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

