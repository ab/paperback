# Paperback

[![Gem Version](https://badge.fury.io/rb/paperback.svg)](https://rubygems.org/gems/paperback)
[![Build status](https://travis-ci.org/ab/paperback.svg)](https://travis-ci.org/ab/paperback)
[![Code Climate](https://codeclimate.com/github/ab/paperback.svg)](https://codeclimate.com/github/ab/paperback)
[![Inline Docs](http://inch-ci.org/github/ab/paperback.svg?branch=master)](http://www.rubydoc.info/github/ab/paperback/master)

*Paperback* is a library that facilitates the creation of paper offline backups
of small amounts of important data, such as encryption keys.

It is designed to be used for long-term paper storage. Arbitrary data to be
backed up is encoded  using QR codes and
[sixword](https://github.com/ab/sixword) English text.

By default, the backup data is GPG-encrypted with a symmetric passphrase to
avoid exposing data to the printer (or scanner, assuming you cover the
passphrase when scanning).

## Usage

Typical usage will be through the `paperback` executable.

```sh
# Back up the content in data.key
paperback data.key out.pdf
```

### More complex patterns

See the [YARD documentation](http://www.rubydoc.info/github/ab/paperback/master).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
