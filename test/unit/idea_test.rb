require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
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
end
