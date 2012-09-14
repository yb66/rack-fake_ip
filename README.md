# Rack::FakeIp

TODO: Write a gem description

## Installation

Go to the repository to either download it or use Bundler (or some such).

And then execute:

    $ bundle install --binstubs --path vendor

Or install it yourself as:

    $ gem install rack-fake_ip

## Usage

    module Example
      def self.app
        app = Rack::Builder.app do
          x = lambda {|e|
            request = Rack::Request.new(e)
            # Do something with IP
            Rack::Response.new(e["REMOTE_ADDR"],200,{"Content-Type" => "text/html"}).finish
          }

          use Rack::FakeIP
          run x
        end
      end # def app
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
