require 'spec_helper'

describe PStep do

  let(:user) { FactoryGirl.create(:user) }
  let(:pahth) { FactoryGirl.create(:pahth) }

  before do
    @p_step = pahth.p_steps.build(title: "One step", type_learning: "Audio", category_knowledge:"Macro",
                               content: "Esse passo vai te ensinar sobre tudo e todos")
  end

  subject { @p_step }

  it { should respond_to(:title) }
  it { should respond_to(:type_learning) }
  it { should respond_to(:category_knowledge) }
  it { should respond_to(:content) }
  its(:pahth) { should == pahth }

  it { should be_valid }

  describe "when title is not present" do
    before { @p_step.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @p_step.title = "a" * 101 }
    it { should_not be_valid }
  end


  describe "when content is not present" do
    before { @p_step.content = " " }
    it { should_not be_valid }
  end

  describe "when type_learning is not present" do
    before { @p_step.type_learning = " " }
    it { should_not be_valid }
  end

  describe "when category_knowledge is not present" do
    before { @p_step.category_knowledge = " " }
    it { should_not be_valid }
  end

  describe "when p_step_id is not present" do
    before { @p_step.pahth_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to pahth_id" do
      expect do
        PStep.new(user_id: pahth.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end


end
