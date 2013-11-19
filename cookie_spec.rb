require "rspec"
require_relative "cookie"

describe Cookie do

  let(:cookie) { Cookie.new("chocolate chip") }

  describe "#initialize" do
    it "creates a cookie object" do
      cookie.should be_an_instance_of Cookie
    end

    it "should accept 1 parameter" do
      expect { Cookie.new("sugar") }.to_not raise_error(ArgumentError)
    end

    it "should not accept multiple parameters" do
      expect { Cookie.new("sugar", "macadamia nuts") }.to raise_error(ArgumentErrors)
    end

    it "should have been baked for 0 minutes" do
      cookie.time_baked.should eq 0
    end
  end


  describe "#time_baked" do
    it "should return an integer" do
      cookie.time_baked.should be_an_instance_of Fixnum
    end

    it "should increase when the cookie has been baked" do
      cookie.bake!(5)
      cookie.time_baked.should eq 5
    end

    it "should not allow assignment" do
      expect { cookie.time_baked = 5 }.to raise_error(NoMethodError)
    end
  end


  describe "#type" do
    it "should return the type of this cookie"  do
      cookie.type.should eq "chocolate chip"
    end

    it "should not allow assignment" do
      expect {cookie.type = "macadamia nut"}.to raise_error(NoMethodError)
    end
  end


  describe "#bake!" do
    it "should only take one argument" do
      expect {cookie.bake!(15)}.to_not raise_error(ArgumentError)
    end

    it "correctly increment the time baked" do
      cookie.bake!(5)
      cookie.time_baked.should eq 5
    end
  end


  describe "#baked_status" do
    #unbaked(0..5), partly baked(6..10), done(11..13), burned(>13)

    it "returns :unbaked if it has been baked for <5 mins" do
      cookie.bake!(rand(0..5))
      cookie.baked_status.should eq :unbaked
    end

    it "returns :partly_baked if it has been baked for 6-10 mins" do
      cookie.bake!(rand(6..10))
      cookie.baked_status.should eq :partly_baked
    end

    it "returns :done if it has been baked for 11-13 mins" do
      cookie.bake!(rand(11..13))
      cookie.baked_status.should eq :done
    end

    it "returns :burned if it has been baked for > 13 mins" do
      cookie.bake!(14)
      cookie.baked_status.should eq :burned
    end

  end

end