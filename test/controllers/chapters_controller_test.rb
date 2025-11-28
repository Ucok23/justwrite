require "test_helper"

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user.update!(password: "password", password_confirmation: "password", admin: true)
    @book = books(:one)
    @book.save!
    @chapter = chapters(:one)
    @chapter.save!
    post login_url, params: { email: @user.email, password: "password" }
  end

  test "should get new" do
    get new_book_chapter_url(@book)
    assert_response :success
  end

  test "should create chapter" do
    assert_difference("Chapter.count") do
      post book_chapters_url(@book), params: { chapter: { content: @chapter.content, title: "New Chapter" } }
    end

    assert_redirected_to book_chapter_url(@book, Chapter.last)
  end

  test "should show chapter" do
    get book_chapter_url(@book, @chapter)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_chapter_url(@book, @chapter)
    assert_response :success
  end

  test "should update chapter" do
    patch book_chapter_url(@book, @chapter), params: { chapter: { content: @chapter.content, title: @chapter.title } }
    assert_redirected_to book_chapter_url(@book, @chapter)
  end

  test "should destroy chapter" do
    assert_difference("Chapter.count", -1) do
      delete book_chapter_url(@book, @chapter)
    end

    assert_redirected_to book_url(@book)
  end
end
