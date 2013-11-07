require 'spec_helper'

describe ApparelsHelper do

  include ApparelsHelper # has methods #login and #logout that modify the session

  describe "should be able to show" do
    it "root apparel" do
      a = Apparel.create! :name => 'Nohavice'

      render_apparel(a, [a.id]).should have_content(a.name)
    end

    it "root apparel with all children (nested)" do
      a = Apparel.create! :name => 'Nohavice'
      a2 = a.children.create! :name => 'Rukavice'
      a3 = a2.children.create! :name => 'Topanky'

      rendering_result = render_apparel(a, [a.id, a2.id, a3.id])

      rendering_result.should have_content(a.name)
      rendering_result.should have_content(a2.name)
      rendering_result.should have_content(a3.name)
    end
  end
end