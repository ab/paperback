# Paperback

[![Gem Version](https://badge.fury.io/rb/paperback.svg)](https://rubygems.org/gems/paperback)
[![Inline Docs](http://inch-ci.org/github/ab/paperback.svg?branch=master)](http://www.rubydoc.info/github/ab/paperback/master)

*Paperback* is a library that facilitates the creation of paper offline backups
of small amounts of important data, such as encryption keys.

It is designed to be used for long-term paper storage. Arbitrary data to be
backed up is encoded using QR codes,
[sixword](https://github.com/ab/sixword) English text, and Base64.

Nothing else approaches the durability and inexpensiveness of paper. This
library is designed to facilitate the restoration process, which would be
tedious and error-prone when using human typists or even OCR.

The QR code is easily machine readible, the sixword text is easiest to
transcribe for humans, and the Base64 serves as a fallback for broadest
compatibility.

By default, the backup data is GPG-encrypted with a symmetric passphrase to
avoid exposing data to the printer (or scanner, assuming you cover the
passphrase when scanning).

The printed document does contain the SHA256 digest of the original content for
error correction, which is not a problem for random data like keys. But if you
are backing up low-entropy secrets and want to preserve the printer-blindness
property, pad the content with a random salt or encrypt it before using
paperback.

## Usage

Typical usage will be through the `paperback` executable. Use the `--help`
option for a usage menu.

```sh
# Back up the content in data.key
paperback data.key out.pdf
```

### Sample output

See [sample directory](./sample)


### More complex patterns

See the [YARD documentation](http://www.rubydoc.info/github/ab/paperback/master).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
