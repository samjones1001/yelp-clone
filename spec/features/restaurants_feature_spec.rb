require 'rails_helper'


feature 'restaurants' do



  context 'no restaurants have been added' do

    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      user = User.create(email: 'email@email.com', password: 'password')
      Restaurant.create(name: 'KFC', user_id: user.id)
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'creating restaurants' do

    context 'user has signed in' do
      before do
        visit '/'
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
      end

      scenario 'prompts user to fill out a form, then displays the new restaurant' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'KFC'
        click_button 'Create Restaurant'
        expect(page).to have_content 'KFC'
        expect(current_path).to eq '/restaurants'
      end

      context 'an invalid restaurant' do
        scenario 'does not let you submit a name that is too short' do
          visit '/restaurants'
          click_link 'Add a restaurant'
          fill_in 'Name', with: 'kf'
          click_button 'Create Restaurant'
          expect(page).not_to have_css 'h2', text: 'kf'
          expect(page).to have_content 'error'
        end
      end

    end

    context 'user is not signed in' do
      before do
        visit '/'
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
      end

      scenario 'prompts user to fill out a form, then displays the new restaurant' do
        click_link('Sign out')
        visit '/restaurants'
        click_link 'Add a restaurant'
        expect(page).to have_content 'Log in'
      end
    end


  end

  context 'viewing restaurants' do



    scenario 'lets a user view a restaurant' do
      user = User.create(email: 'email@email.com', password: 'password')
      kfc = Restaurant.create(name:'KFC', user_id: user.id)

      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  context 'editing restaurants ' do
    context 'user can edit own restraunts' do
      before do
        visit '/'
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
        click_link 'Add a restaurant'
        fill_in('Name', with: 'KFC')
        fill_in('Description', with: 'Vile')
        click_button('Create Restaurant')
      end

      scenario ' let a user edit a restaurant ' do
        visit '/restaurants'
        click_link 'Edit KFC'
        fill_in 'Name', with: 'Kentucky Fried Chicken'
        fill_in 'Description', with: 'Deep fried goodness'
        click_button 'Update Restaurant'
        click_link 'Kentucky Fried Chicken'
        expect(page).to have_content 'Kentucky Fried Chicken'
        expect(page).to have_content 'Deep fried goodness'
      end
    end
    context 'user cannot edit other\'s restaurants' do
      before do
        visit '/'
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
        click_link 'Add a restaurant'
        fill_in('Name', with: 'KFC')
        fill_in('Description', with: 'Vile')
        click_button('Create Restaurant')
        click_link('Sign out')
        click_link('Sign up')
        fill_in('Email', with: 'test2@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
      end

      scenario 'will not allow editing' do
        visit '/restaurants'
        click_link 'Edit KFC'
        expect(page).to have_content('error')
      end
    end
  end

  context 'deleting restaurants' do

    context 'user can delete own restaurant' do
      before do
        visit '/'
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
        click_link 'Add a restaurant'
        fill_in('Name', with: 'KFC')
        fill_in('Description', with: 'Vile')
        click_button('Create Restaurant')
      end

      scenario 'removes a restaurant when a user clicks a delete link' do
        visit '/restaurants'
        click_link 'Delete KFC'
        expect(page).not_to have_content 'KFC'
        expect(page).to have_content 'Restaurant deleted successfully'
      end
    end

    context 'user cannot delete other\'s restaurants' do
      before do
        visit '/'
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
        click_link 'Add a restaurant'
        fill_in('Name', with: 'KFC')
        fill_in('Description', with: 'Vile')
        click_button('Create Restaurant')
        click_link('Sign out')
        click_link('Sign up')
        fill_in('Email', with: 'test2@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
      end

      scenario 'pressing delete does not work' do
        visit '/restaurants'
        click_link 'Delete KFC'
        expect(page).to have_content 'KFC'
        expect(page).to have_content 'error'
      end
    end
  end


end
