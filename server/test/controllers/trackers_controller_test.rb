require 'test_helper'

class TrackersControllerTest < ActionController::TestCase
  setup do
    @tracker = trackers(:one)
    sign_in_as(users(:bob))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trackers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tracker" do
    assert_difference('Tracker.count') do
      post :create, tracker: { name: @tracker.name }
    end

    assert_redirected_to tracker_path(assigns(:tracker))
  end

  test "should show tracker" do
    get :show, id: @tracker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tracker
    assert_response :success
  end

  test "should update tracker" do
    patch :update, id: @tracker, tracker: { name: @tracker.name }
    assert_redirected_to tracker_path(assigns(:tracker))
  end

  test "should destroy tracker" do
    assert_difference('Tracker.count', -1) do
      delete :destroy, id: @tracker
    end

    assert_redirected_to trackers_path
  end

  test "should only get trackers belonging to user" do
    get :index
    assert_equal(4,Tracker.all.count)
    assert_equal(3,assigns(:trackers).count)
    assert_equal("bob@example.com",assigns(:trackers).first.user.email)
  end

  test "should only work if you're signed in" do
    sign_out
    get :index
    assert_redirected_to sign_in_path
  end
end
