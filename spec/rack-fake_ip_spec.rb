# encoding: UTF-8

require 'spec_helper'
require_relative "../lib/rack/fake_ip.rb"

describe "Rack::FakeIP" do

  context ":static option set to false" do
    include_context "Application", :static => false
    before { get "/" }
    context "Checking the response is ok" do
      subject { last_response }
      it { should be_ok }
    end
    context "Checking the fake IP address is set and valid" do
      subject { last_response.body }
      it { should_not be_nil }
      it { should_not == "127.0.0.1" }
      specify { IPAddr.new(subject).ipv4?.should be_true }
    end
    it "IP between requests should differ" do
      first_response = last_response.body
      get "/a-different-route"
      last_response.body.should_not == first_response 
    end
  end

  context ":static option set to true" do
    include_context "Application", :static => true
    it "IP between requests should be the same" do
      get "/"
      first_response = last_response.body
      get "/a-different-route",{}, {"rack.session" => {"fake_ip" => first_response }}
      last_response.body.should == first_response 
    end
  end
end