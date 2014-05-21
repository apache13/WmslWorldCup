require 'test_helper'

class JakkritsControllerTest < ActionController::TestCase
  setup do
    @jakkrit = jakkrits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jakkrits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jakkrit" do
    assert_difference('Jakkrit.count') do
      post :create, jakkrit: { age: @jakkrit.age, name: @jakkrit.name }
    end

    assert_redirected_to jakkrit_path(assigns(:jakkrit))
  end

  test "should show jakkrit" do
    get :show, id: @jakkrit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jakkrit
    assert_response :success
  end

  test "should update jakkrit" do
    patch :update, id: @jakkrit, jakkrit: { age: @jakkrit.age, name: @jakkrit.name }
    assert_redirected_to jakkrit_path(assigns(:jakkrit))
  end

  test "should destroy jakkrit" do
    assert_difference('Jakkrit.count', -1) do
      delete :destroy, id: @jakkrit
    end

    assert_redirected_to jakkrits_path
  end
end
