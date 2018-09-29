require 'rails_helper'

RSpec.feature "Create posts", type: :feature do
  scenario "user creates a post" do
    post_one = create(:post, caption: "first post")
    post_two = create(:post, caption: "second post")

    visit '/'
    expect(page).to have_content('first post')
    expect(page).to have_content('second post')
    puts page.body
    expect(page).to have_css("img[src*='tesla-cat.jpg']")
  end 
end