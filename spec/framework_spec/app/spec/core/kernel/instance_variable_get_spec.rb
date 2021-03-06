require File.dirname(File.join(__rhoGetCurrentDir(), __FILE__)) + '/../../spec_helper'
require File.dirname(File.join(__rhoGetCurrentDir(), __FILE__)) + '/fixtures/classes'

describe "Kernel#instance_variable_get" do
  before(:each) do
    @obj = Object.new
    @obj.instance_variable_set("@test", :test)
  end

  it "tries to convert the passed argument to a String using #to_str" do
    obj = mock("to_str")
    obj.should_receive(:to_str).and_return("@test")
    @obj.instance_variable_get(obj)
  end

  it "returns the value of the passed instance variable that is referred to by the conversion result" do
    obj = mock("to_str")
    obj.stub!(:to_str).and_return("@test")
    @obj.instance_variable_get(obj).should == :test
  end

  it "returns nil when the referred instance variable does not exist" do
    @obj.instance_variable_get(:@does_not_exist).should be_nil
  end

  it "raises a TypeError when the passed argument does not respond to #to_str" do
    lambda { @obj.instance_variable_get(Object.new) }.should raise_error(TypeError)
  end

  it "raises a TypeError when the passed argument can't be converted to a String" do
    obj = mock("to_str")
    obj.stub!(:to_str).and_return(123)
    lambda { @obj.instance_variable_get(obj) }.should raise_error(TypeError)
  end

  it "raises a NameError when the conversion result does not start with an '@'" do
    obj = mock("to_str")
    obj.stub!(:to_str).and_return("test")
    lambda { @obj.instance_variable_get(obj) }.should raise_error(NameError)
  end
end

describe "Kernel#instance_variable_get when passed Symbol" do
  before(:each) do
    @obj = Object.new
    @obj.instance_variable_set("@test", :test)
  end

  it "returns the value of the instance variable that is referred to by the passed Symbol" do
    @obj.instance_variable_get(:@test).should == :test
  end

  it "raises a NameError when the passed Symbol does not start with an '@'" do
    lambda { @obj.instance_variable_get(:test) }.should raise_error(NameError)
  end
end

describe "Kernel#instance_variable_get when passed String" do
  before(:each) do
    @obj = Object.new
    @obj.instance_variable_set("@test", :test)
  end

  it "returns the value of the instance variable that is referred to by the passed String" do
    @obj.instance_variable_get("@test").should == :test
  end

  it "raises a NameError when the passed String does not start with an '@'" do
    lambda { @obj.instance_variable_get("test") }.should raise_error(NameError)
  end
end

describe "Kernel#instance_variable_get when passed Fixnum" do
  before(:each) do
    @obj = Object.new
    @obj.instance_variable_set("@test", :test)
  end

  ruby_version_is "" ... "1.9" do
    deviates_on :rubinius do
      it "always raises an ArgumentError" do
        lambda { @obj.instance_variable_get(0) }.should raise_error(ArgumentError)
        lambda { @obj.instance_variable_get(10) }.should raise_error(ArgumentError)
        lambda { @obj.instance_variable_get(100) }.should raise_error(ArgumentError)
        lambda { @obj.instance_variable_get(-100) }.should raise_error(ArgumentError)
      end
    end

    not_compliant_on :rubinius do
      it "tries to convert the passed Integer to a Symbol and returns the instance variable that is referred by the Symbol" do
        @obj.instance_variable_get(:@test.to_i).should == :test
      end

      it "outputs a warning" do
        lambda { @obj.instance_variable_get(:@test.to_i) }.should complain(/#{"do not use Fixnums as Symbols"}/)
      end

      it "raises an ArgumentError when the passed Fixnum can't be converted to a Symbol" do
        lambda { @obj.instance_variable_get(-10) }.should raise_error(ArgumentError)
      end

      it "raises a NameError when the Symbol does not start with an '@'" do
        lambda { @obj.instance_variable_get(:test.to_i) }.should raise_error(NameError)
      end
    end
  end

  ruby_version_is "1.9" do
    it "raises a TypeError" do
      lambda { @obj.instance_variable_get(10) }.should raise_error(TypeError)
      lambda { @obj.instance_variable_get(-10) }.should raise_error(TypeError)
    end
  end
end
