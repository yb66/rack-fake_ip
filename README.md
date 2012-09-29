# Rack::FakeIp

## Why? ##

Sometimes it's helpful while developing to pretend that you're not connecting from 127.0.0.1, in a couple of lines of reusable code that don't revolve around a google search like "ruby generate random ip" ;-)

## Installation

Go to the repository to either download it or use Bundler (or some such).

And then execute:

    $ bundle install --binstubs --path vendor

Or install it yourself as:

    $ gem install rack-fake_ip

## Usage

Put the FakeIP middleware _before_ anything that might require the fake IP.

    module Example
      def self.app
        app = Rack::Builder.app do
        
          use Rack::FakeIP
          
          use Rack::GeoIPCity, :db => "/path/to/db" # for example

          x = lambda {|e|
            request = Rack::Request.new(e)
            # Do something with IP or env
            Rack::Response.new(e["REMOTE_ADDR"],200,{"Content-Type" => "text/html"}).finish
          }

          run x
        end
      end # def app
    end


## Contributing

* Fork it
* Checkout the development branch (`git checkout develop`)
* Create your feature branch (`git checkout -b my-new-feature`)
* Commit your changes (`git commit -am 'Added some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create new Pull Request
