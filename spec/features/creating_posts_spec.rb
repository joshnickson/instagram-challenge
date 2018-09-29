require 'rails_helper'

RSpec.feature "Create posts", type: :feature do
  scenario "user creates a post" do
    visit '/'
    puts page.body
    click_on 'New Post'
    attach_file('Image', File.join(Rails.root, '/spec/tesla-cat.jpg'))


    fill_in 'Caption', with: 'test #test' 
    click_button 'Create Post'
    expect(page).to have_content('#test')
    expect(page).to have_css("img[src*='tesla-cat.jpg']")
  end
end