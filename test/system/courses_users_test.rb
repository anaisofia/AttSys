require "application_system_test_case"

class CoursesUsersTest < ApplicationSystemTestCase
  setup do
    @courses_user = courses_users(:one)
  end

  test "visiting the index" do
    visit courses_users_url
    assert_selector "h1", text: "Courses Users"
  end

  test "creating a Courses user" do
    visit courses_users_url
    click_on "New Courses User"

    fill_in "Course", with: @courses_user.course_id
    fill_in "User", with: @courses_user.user_id
    click_on "Create Courses user"

    assert_text "Courses user was successfully created"
    click_on "Back"
  end

  test "updating a Courses user" do
    visit courses_users_url
    click_on "Edit", match: :first

    fill_in "Course", with: @courses_user.course_id
    fill_in "User", with: @courses_user.user_id
    click_on "Update Courses user"

    assert_text "Courses user was successfully updated"
    click_on "Back"
  end

  test "destroying a Courses user" do
    visit courses_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Courses user was successfully destroyed"
  end
end
