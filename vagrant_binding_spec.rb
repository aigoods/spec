require 'spec_helper'

describe VagrantBinding do
  let(:server) { Rails::Server.new }
  it 'has a version number' do
    expect(VagrantBinding::VERSION).not_to be nil
  end

  context "when in development mode" do

	it 'has changed the default host' do
	  expect(Rails.env).to receive(:development?).and_return(true)
	  expect(server.options[:Host]).to eq("0.0.0.0")
	end
  end

  context "when in production or test modes" do

  	it 'has not changed the default host' do
  	  expect(Rails.env).to receive(:development?).and_return(false)
	  expect(server.options[:Host]).to eq("localhost")
	end
  end

  
end
