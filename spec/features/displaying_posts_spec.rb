require 'rails_helper'

RSpec.feature "Diplaying posts", type: :feature do
  scenario "index shows mulitple posts" do
    post_one = create(:post, caption: "first post")
    post_two = create(:post, caption: "second post")

    visit '/'
    expect(page).to have_content('first post')
    expect(page).to have_content('second post')
    expect(page).to have_css("img[src*='tesla-cat.jpg']")
  end 
  
end

RSpec.feature "Single post view", type: :feature do
    scenario 'user can view a single post' do
    post = create(:post)
    visit '/'
    first(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end