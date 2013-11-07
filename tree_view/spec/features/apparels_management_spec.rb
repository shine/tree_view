require 'spec_helper'

feature 'User tries to add new apparel' do
  describe "and opens new apparel page" do
    before :each do
      visit new_apparel_path
    end

    it "should contain needed fields" do
      page.should have_content("Name")
      page.should have_content("Parent")
      page.should have_button("Create")
    end

    it "should get error message if name was not selected" do
      click_button('Create')

      page.should have_content("Name can't be blank")     
    end

    it "should be able to create root apparel" do
      Apparel.count.should == 0

      fill_in "Name", :with => 'Socks'
      click_button('Create')  
      
      Apparel.count.should == 1
      Apparel.first.name.should == 'Socks'
      Apparel.first.parent.should be_nil
    end

    it "should be able to create child apparel" do
      root = Apparel.create :name => 'Nohavice'
      Apparel.count.should == 1

      visit new_apparel_path # need to refresh page after root apparel was added

      fill_in "Name", :with => 'Socks'
      select(root.name, :from => 'Parent')
      click_button('Create')  
      
      Apparel.count.should == 2
      Apparel.last.name.should == 'Socks'
      Apparel.last.parent.id.should == root.id
    end
  end
end