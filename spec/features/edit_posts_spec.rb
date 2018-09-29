require 'rails_helper'

RSpec.feature "Editing posts", type: :feature do
  background do
    post = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can edit a caption' do
    fill_in 'Caption', with: "Caption edit"
    click_on 'Update Post'

    expect(page).to have_content("Caption edit")
  end
end
