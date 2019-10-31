require "application_system_test_case"

class TeachersTest < ApplicationSystemTestCase
  setup do
    @teacher = teachers(:one)
  end

  test "visiting the index" do
    visit teachers_url
    assert_selector "h1", text: "Teachers"
  end

  test "creating a Teacher" do
    visit teachers_url
    click_on "New Teacher"

    check "Active" if @teacher.active
    fill_in "Address", with: @teacher.address
    fill_in "Birthdate", with: @teacher.birthdate
    fill_in "Email", with: @teacher.email
    fill_in "Name", with: @teacher.name
    fill_in "Nationality", with: @teacher.nationality
    fill_in "Password", with: @teacher.password
    fill_in "Phone", with: @teacher.phone
    fill_in "Summary", with: @teacher.summary
    click_on "Create Teacher"

    assert_text "Teacher was successfully created"
    click_on "Back"
  end

  test "updating a Teacher" do
    visit teachers_url
    click_on "Edit", match: :first

    check "Active" if @teacher.active
    fill_in "Address", with: @teacher.address
    fill_in "Birthdate", with: @teacher.birthdate
    fill_in "Email", with: @teacher.email
    fill_in "Name", with: @teacher.name
    fill_in "Nationality", with: @teacher.nationality
    fill_in "Password", with: @teacher.password
    fill_in "Phone", with: @teacher.phone
    fill_in "Summary", with: @teacher.summary
    click_on "Update Teacher"

    assert_text "Teacher was successfully updated"
    click_on "Back"
  end

  test "destroying a Teacher" do
    visit teachers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teacher was successfully destroyed"
  end
end
