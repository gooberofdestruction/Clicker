require 'test_helper'

class StudentAnswersControllerTest < ActionController::TestCase
  setup do
    @student_answer = student_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_answer" do
    assert_difference('StudentAnswer.count') do
      post :create, :student_answer => @student_answer.attributes
    end

    assert_redirected_to student_answer_path(assigns(:student_answer))
  end

  test "should show student_answer" do
    get :show, :id => @student_answer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @student_answer.to_param
    assert_response :success
  end

  test "should update student_answer" do
    put :update, :id => @student_answer.to_param, :student_answer => @student_answer.attributes
    assert_redirected_to student_answer_path(assigns(:student_answer))
  end

  test "should destroy student_answer" do
    assert_difference('StudentAnswer.count', -1) do
      delete :destroy, :id => @student_answer.to_param
    end

    assert_redirected_to student_answers_path
  end
end
