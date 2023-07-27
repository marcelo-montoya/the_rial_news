require "test_helper"

class PublicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @publication = publications(:one)
    @user = users(:one)
  end

  test "should get index" do
    get publications_url
    assert_response :success
    assert_equal 200, response.status
    assert_equal "utf-8", response.charset
  end

  test "should get new" do
    sign_in @user
    get new_publication_url
    assert_response :success
    assert_equal 302, response.status
    assert_equal "utf-8", response.charset
  end
   test "should get new" do
     sign_in @admin
     get new_publication_url
     assert_response :success
     assert_equal 302, response.status
     assert_equal "utf-8", response.charset
   end



  test "should create publication" do
    assert_difference("Publication.count") do
      post publications_url, params: { publication: { description: @publication.description, title: @publication.title, user_id: @publication.user_id } }
    
    end

    assert_redirected_to publication_url(Publication.last)
  end

  test "should show publication" do
    get publication_url(@publication)
    assert_response :success
    assert_equal 200, response.status
    assert_equal "utf-8", response.charset
  end

  test "should get edit" do
    sign_in @admin
    get edit_publication_url(@publication)
    assert_response :success
    assert_equal 200, response.status
    assert_equal "utf-8", response.charset
  end

  test "should update publication" do
    sign_in @admin
    patch publication_url(@publication), params: { publication: { description: @publication.description, title: @publication.title, user_id: @publication.user_id } }
    assert_redirected_to publication_url(@publication)
  end

  test "should destroy publication" do
    sign_in @admin
    assert_difference("Publication.count", -1) do
      delete publication_url(@publication)
    end

    assert_redirected_to publications_url
  end
end
