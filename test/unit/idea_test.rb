require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  include ActiveSupport::Testing::Pending

  test "name can't be blank" do
    idea = Idea.new
    assert idea.invalid?
    assert idea.errors[:name].present?
    assert idea.errors[:name].include?("can't be blank")
  end
  
  test "name must be unique" do
    idea = FactoryGirl.create(:idea)
    
    new_idea = Idea.new(name: idea.name)
    assert new_idea.invalid?
    assert new_idea.errors[:name].present?
    assert new_idea.errors[:name].include?('has already been taken')
  end
  
  test "either its description or picture must be present" do
    pending "well, we'll see about that.."
    idea = FactoryGirl.create(:idea, description: ' ', picture: nil)
    assert idea.invalid?
    assert new_idea.errors.get(:base).present?
    assert new_idea.errors.get(:base).any? { |err| err =~ /either description or picture must be filled in/i }
  end
end
