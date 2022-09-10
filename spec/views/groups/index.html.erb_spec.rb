require 'rails_helper'

RSpec.describe 'GroupsIndex', type: :system do
  describe 'New' do
    before(:each) do
      @user = User.new(name: 'Mar', email: 'mar@email.com', password: '123456')
      @user.save
      visit new_user_session_path
      fill_in 'Email', with: 'mar@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    before(:all) do
      driven_by(:selenium_chrome_headless)
    end

    it 'should show categories title' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'should show Add Category button' do
      expect(page).to have_button('Add a new category')
    end

    it 'should take to new group form' do
      click_button 'Add a new category'
      expect(page).to have_content('You can select an Icon')
    end
  end
end