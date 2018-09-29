# create an example post using factory_girl
# visit the root route
# click on the image to 'show' the individual post
# click on the 'Edit Post' button to enter the edit view
# click on the 'Delete Post' button
# expect to be routed to the root again.
# expect to see the message "Problem solved!  Post deleted."
# expect to not see the old post anymore.

require 'rails_helper'

RSpec.feature "Editing posts", type: :feature do
  background do
    post = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'can edit a caption' do
    click_link 'Delete Post'
    expect(page).to have_content("Post successfully deleted")
    expect(page).not_to have_content("#test")
  end

end
