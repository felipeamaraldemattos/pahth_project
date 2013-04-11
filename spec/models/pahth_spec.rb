require 'spec_helper'


describe Pahth do

  let(:user) { FactoryGirl.create(:user) }

  before do
    @pahth = user.pahths.build(title: "The master pahth", pahth_tipo: "Root Knowlodge",
        description: "Esse caminho vai te ensinar sobre tudo e todos" )
  end

  subject { @pahth }

  it { should respond_to(:title) }
  it { should respond_to(:pahth_tipo) }
  it { should respond_to(:description) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when title is not present" do
    before { @pahth.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @pahth.title = "a" * 21 }
    it { should_not be_valid }
  end


  describe "when type is not present" do
    before { @pahth.pahth_tipo = " " }
    it { should_not be_valid }
  end

  describe "when type is too long" do
    before { @pahth.pahth_tipo = "a" * 21 }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @pahth.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Pahth.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

end