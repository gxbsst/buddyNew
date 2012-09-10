# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Pictures" do
    describe "Admin" do
      describe "pictures" do
        login_refinery_user

        describe "pictures list" do
          before do
            FactoryGirl.create(:picture, :title => "UniqueTitleOne")
            FactoryGirl.create(:picture, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.pictures_admin_pictures_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.pictures_admin_pictures_path

            click_link "Add New Picture"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Pictures::Picture.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Pictures::Picture.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:picture, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.pictures_admin_pictures_path

              click_link "Add New Picture"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Pictures::Picture.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:picture, :title => "A title") }

          it "should succeed" do
            visit refinery.pictures_admin_pictures_path

            within ".actions" do
              click_link "Edit this picture"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:picture, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.pictures_admin_pictures_path

            click_link "Remove this picture forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Pictures::Picture.count.should == 0
          end
        end

      end
    end
  end
end
