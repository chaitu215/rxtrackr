require 'test_helper'

class ProviderProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provider_profile = provider_profiles(:one)
  end

  test "should get index" do
    get provider_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_provider_profile_url
    assert_response :success
  end

  test "should create provider_profile" do
    assert_difference('ProviderProfile.count') do
      post provider_profiles_url, params: { provider_profile: {  } }
    end

    assert_redirected_to provider_profile_url(ProviderProfile.last)
  end

  test "should show provider_profile" do
    get provider_profile_url(@provider_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_provider_profile_url(@provider_profile)
    assert_response :success
  end

  test "should update provider_profile" do
    patch provider_profile_url(@provider_profile), params: { provider_profile: {  } }
    assert_redirected_to provider_profile_url(@provider_profile)
  end

  test "should destroy provider_profile" do
    assert_difference('ProviderProfile.count', -1) do
      delete provider_profile_url(@provider_profile)
    end

    assert_redirected_to provider_profiles_url
  end
end
