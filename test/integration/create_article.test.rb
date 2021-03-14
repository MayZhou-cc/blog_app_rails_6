require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: "johndoe", email: "johndoe@example.com",
                              password: "password", admin: true)
    sign_in_as(@admin_user)
  end

  test "get create article form and create a new article" do
    get new_article_path
    assert_response :success
    assert_difference 'Article.count',1 do
      post articles_path, params: { article: { title: 'Another New Article Title', description: 'Another New article description.' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'Another New Article Title', response.body
  end
end