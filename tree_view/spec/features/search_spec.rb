require 'spec_helper'

feature 'User tries to search' do
  describe "and opens list page" do
    it "should contain existing apparels" do
      Apparel.create! :name => 'Tricko'
      visit apparels_path
      page.should have_content("Tricko")
    end

    it "should be able to see only filtered items after search" do
      Apparel.create! :name => 'Tricko'
      Apparel.create! :name => 'Nohavice'
      Apparel.create! :name => 'Rukavice'

      visit apparels_path

      fill_in('filter', :with => 'vice')
      click_button('search')

      page.should_not have_content("Tricko")
      page.should have_content("Nohavice")
      page.should have_content("Rukavice")
    end

    it "should be able to see root item of founded item" do
      a1 = Apparel.create! :name => 'Tricko'
      a2 = a1.children.create! :name => 'Nohavice'
      a2.children.create! :name => 'Nike'

      visit apparels_path

      fill_in('filter', :with => 'vice')
      click_button('search')

      page.should have_content("Tricko")
    end

    it "should be not able to see child items of founded item" do
      a1 = Apparel.create! :name => 'Tricko'
      a2 = a1.children.create! :name => 'Nohavice'
      a2.children.create! :name => 'Nike'

      visit apparels_path

      fill_in('filter', :with => 'vice')
      click_button('search')

      page.should_not have_content("Nike")
    end

    it "should see meaningful message when got no results" do
      a1 = Apparel.create! :name => 'Tricko'
      a2 = a1.children.create! :name => 'Nohavice'
      a2.children.create! :name => 'Nike'

      visit apparels_path

      fill_in('filter', :with => 'capybara')
      click_button('search')

      page.should have_content("No apparels were found.")
    end
  end
end