# encoding: UTF-8

require 'spec_helper'
require_relative "../lib/rack/fake_ip.rb"

describe "Rack::FakeIP" do
  include_context "Application"

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
end