require 'test_helper'

class CalculationConfigsControllerTest < ActionController::TestCase
  setup do
    @calculation_config = calculation_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calculation_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calculation_config" do
    assert_difference('CalculationConfig.count') do
      post :create, calculation_config: { own_goal_multiply: @calculation_config.own_goal_multiply, penalty_multiply: @calculation_config.penalty_multiply, red_card_multiply: @calculation_config.red_card_multiply, score_multiply: @calculation_config.score_multiply, team_winner_multiply: @calculation_config.team_winner_multiply, yellow_card_multiply: @calculation_config.yellow_card_multiply }
    end

    assert_redirected_to calculation_config_path(assigns(:calculation_config))
  end

  test "should show calculation_config" do
    get :show, id: @calculation_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calculation_config
    assert_response :success
  end

  test "should update calculation_config" do
    patch :update, id: @calculation_config, calculation_config: { own_goal_multiply: @calculation_config.own_goal_multiply, penalty_multiply: @calculation_config.penalty_multiply, red_card_multiply: @calculation_config.red_card_multiply, score_multiply: @calculation_config.score_multiply, team_winner_multiply: @calculation_config.team_winner_multiply, yellow_card_multiply: @calculation_config.yellow_card_multiply }
    assert_redirected_to calculation_config_path(assigns(:calculation_config))
  end

  test "should destroy calculation_config" do
    assert_difference('CalculationConfig.count', -1) do
      delete :destroy, id: @calculation_config
    end

    assert_redirected_to calculation_configs_path
  end
end
