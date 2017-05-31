describe "signing in", :type => :feature do
  before :all do
    x = User.create(full_name: 'michchchchoooo', email: 'm@gmail.com', password: '123123')
  end

  it "signing in" do
    visit '/'
    within(".container") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => '123123'
      click_button 'Submit'
    end
    expect(page).to have_content 'Welcome'
  end
end