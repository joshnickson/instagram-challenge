require 'rails_helper'

RSpec.feature "Create posts", type: :feature do
  scenario "user creates a post" do
    visit '/'
    click_on 'New Post'
    attach_file('Image', File.join(Rails.root, '/spec/tesla-cat.jpg'))
    fill_in 'Caption', with: 'test #test' 
    click_button 'Create Post'
    expect(page).to have_content('#test')
    expect(page).to have_css("img[src*='tesla-cat.jpg']")
  end
  scenario 'image is required to make a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'test #test' 
    click_button 'Create Post'
    expect(page).to have_content('You must add an image!')
  end
end