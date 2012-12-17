# thor-install-gist

A thor sub-command to install thor tasks from gists

## Installation

Just install it yourself as:

    $ gem install thor-install-gist

Then run below as guide:

    $ thor-install-gist-init

Command will be installed into your `$HOME/.thor`.

### Using with bundler

When you use bundler and `Gemfile` in your project, thor command will automatically load the Gemfile.

So if you want to use thor-install-gist command in your project, you must explicitly add below:

```ruby
gem 'thor-install-gist'
```

Otherwise you can't load necessary 'thor-install-gist' file...

## Usage

If you have installed then run below:

    $ thor install:gist GIST_ID

`GIST_ID` should be a Gist's ID (your `123456`),
or URL can be used (`https://gist.github.com/123456`) for copying and pasting

Options `--as` and `--force` can be used as you do `thor install`

## License

See LICENSE.txt

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
