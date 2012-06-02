require 'test_helper'

class IdeasControllerTest < ActionController::TestCase
  test "should get index" do
    Idea.expects(:all).returns(ideas)
    get :index
    
    assert_response :success
    assert_not_nil assigns(:ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idea" do
    attrs = idea.attributes
    Idea.expects(:count).twice.returns(0, 1)
    Idea.expects(:new).with(attrs).returns(idea)
    idea.expects(:save).returns(true)
    
    assert_difference('Idea.count') do
      post :create, idea: idea.attributes
    end
    
    assert_redirected_to idea_path(assigns(:idea))
  end

  test "should show idea" do
    Idea.expects(:find).with(idea.id.to_s).returns(idea)
    get :show, id: idea
    
    assert_response :success
  end

  test "should get edit" do
    Idea.expects(:find).with(idea.id.to_s).returns(idea)
    get :edit, id: idea
    
    assert_response :success
  end

  test "should update idea" do
    Idea.expects(:find).with(idea.id.to_s).returns(idea)
    idea.expects(:update_attributes).returns(true)
    
    put :update, id: idea, idea: { description: idea.description, name: "_#{idea.name}", picture: idea.picture }
    
    assert_redirected_to idea_path(assigns(:idea))
  end

  test "should destroy idea" do
    Idea.expects(:count).twice.returns(1, 0)
    Idea.expects(:find).with(idea.id.to_s).returns(idea)
    Idea.any_instance.stubs(:destroy).returns(idea.freeze)
    
    assert_difference('Idea.count', -1) do
      delete :destroy, id: idea
    end

    assert_redirected_to ideas_path
  end
  
private

  def ideas
    (1..3).map do |i|
      idea = Idea.new(name: "Idea ##{i}", description: "This is idea ##{i}")
      idea.stubs(:id).returns(i)
      idea.stubs(:persisted?).returns(true)
      idea
    end
  end
  
  def idea
    @idea ||= ideas.first
  end
end
