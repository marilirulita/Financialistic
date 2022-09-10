require 'rails_helper'

RSpec.describe 'GroupsNew', type: :system do
  describe 'New' do
    before(:each) do
      @user = User.create(name: 'Mar', email: 'mar@email.com', password: '123456')
      visit new_user_session_path
      fill_in 'Email', with: 'mar@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_button 'Add a new category'
    end

    before(:all) do
      driven_by(:selenium_chrome_headless)
    end

    it 'should show new group form' do
      expect(page).to have_content('You can select an Icon')
    end

    it 'should show name field' do
      expect(page).to have_field('Category name')
    end

    it 'should show submit button' do
      expect(page).to have_button('Save')
    end

    it 'should create new group' do
      fill_in 'Category name', with: 'Test Group'
      select 'pot-food'
      click_button 'Save'
      expect(page).to have_content('CATEGORIES')
    end
  end
end
