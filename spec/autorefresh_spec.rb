require File.join( File.expand_path(File.dirname(__FILE__)), 'spec_helper')

describe "The AutoRefresh helper" do
  before do
    @channel = 'testchannel'
    @helper = AutoRefresh.channel(@channel)
  end
  it "should accept a channel name and return a string" do
    @helper.class.should.equal String
  end

  it "should include the pusher js client" do
    @helper.should.match /src=".*pusher\.js/
  end

  it "should set the Pusher key" do
    @helper.should.match /new Pusher\('#{AutoRefresh.pusher_key}'\)/
  end

  it "should subscribe to the specified channel" do
    @helper.should.match /pusher\.subscribe\('#{@channel}'\)/
  end
end

describe "Sending a refresh event" do
  before do
  end

  it "should return true" do
    @result = AutoRefresh.refresh(@channel)
    @result.should.equal true
  end
end
