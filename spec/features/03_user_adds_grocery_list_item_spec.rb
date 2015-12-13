require "spec_helper"

feature "user adds grocery list item and quntity" do
  scenario "quantity added when filled form submitted" do
    visit "/groceries"

    fill_in "Name", with: "coke zero"
    fill_in "Quantity", with: "2"
    click_on "Add"

    expect(page).to have_content("coke zero,2")
  end

  scenario "empty li element is not added when form missing name is submitted" do
    visit "/groceries"
    click_on "Add"

    expect(page).not_to have_selector("li")
  end
end

feature "clicking an item displays it on a new page" do
  scenario "viewing clicked item on a new page" do
    visit "/groceries"

    fill_in "Name", with: "coke zero"
    fill_in "Quantity", with: "2"
    click_on "Add"

    expect(page).to have_content("coke zero,2")
  end
end
