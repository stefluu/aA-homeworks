feature "the signup process" do

  scenario "has a new user page" do
    visit "/users/new"
    expect(page).to have_content "Sign Up!"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', with: "hello@hello.com"
      fill_in 'password', with: "password"
      click_on "Sign Up"

      expect(page).to have_content("hello@hello.com")
      expect(current_page).to eq("users/#{User.find_by(email: "hello@hello.com").id}")
    end

    scenario "redirects to bands index page after signup"
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', with: "hello@hello.com"
      click_on "Sign Up"

    end

    scenario "re-renders the signup page after failed signup" do
      expect(current_path).to eq("/users")
      expect(page).to have_content("Password can't be blank")
    end
  end

end
