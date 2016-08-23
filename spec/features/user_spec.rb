require 'rails_helper'
require 'spec_helper'

feature 'User management up' do
  scenario 'Signing up as a new user', js: true do
    user = build(:user)

    visit root_path

    click_link 'Get Started'
    click_link 'Sign up now'

    fill_in 'Nickname', with: user.nickname
    fill_in 'E-Mail', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Save'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Welcome! You have signed up successfully.'

    within '.dropdown-toggle' do
      expect(page).to have_content user.nickname
    end

    Capybara::Screenshot.screenshot_and_open_image

  end
end

feature 'Posting prototype' do
  scenario 'Signing up and posting a new prototype', js: true do
    user = build(:user)
    prototype = build(:prototype)

    login_as user, scope: :user
    visit root_path


      click_on 'New Proto'

      fill_in 'Title', with: prototype.name
      attach_file 'prototype[images_attributes][0][image_url]', "#{Rails.root}/spec/fixture/profile_image.png", visible: false

      fill_in 'Catch Copy', with: prototype.catchcopy
      fill_in 'Concept', with: prototype.concept

      click_on 'Publish'


      Capybara::Screenshot.screenshot_and_open_image

  end
end
