require 'rails_helper'

RSpec.describe 'moves/new', type: :system do
  describe 'New' do
    before(:all) do
      Group.delete_all
      User.delete_all 
      
      driven_by(:selenium_chrome_headless)
    end
    before(:all) do
      @user = User.new(name: 'Mar', email: 'mar@email.com', password: '123456', confirmed_at: Time.now)
      @user.save
      @group = Group.new(name: 'Payment', icon: 'credit-card', user_id: @user.id)
      @group.save
      visit new_user_session_path
      fill_in 'Email', with: 'mar@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      find('.group_element').click
    end

    it 'should show category show page' do
      expect(page).to have_content('TRANSACTIONS')
      expect(page).to have_content('TOTAL SPENT')
      click_button 'Add Transaction'
      expect(page).to have_field('Transaction Name')
      expect(page).to have_field('Amount')
      expect(page).to have_button('Save')
      fill_in 'Transaction Name', with: 'Test Transaction'
      fill_in 'Amount', with: '100'
      click_button 'Save'
      expect(page).to have_content('Test Transaction')
    end

  end
  end