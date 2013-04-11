require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin" do
    before {visit login_path}

    describe "with invalid information" do
      before {click_button "Submit"}

      it { should have_selector('title', text: 'Log In') }
      it { should have_selector('div.alert.alert-error', text: 'error') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before {sign_in user}

      it { should have_selector('title', text: user.name) }
      it { should have_link('Log Out',    href: logout_path) }
      it { should_not have_link('Log In',    href: login_path) }

      describe "followed by logout" do
        before{ click_link "Log Out"}
        it { should have_link('Log In') }
      end
    end

  end

  describe "authorization" do

    describe "for non loged in user" do
      let(:user) {FactoryGirl.create(:user)}

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Log In') }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(login_path) }
        end

        describe "when attempting to visit a protected page" do
          before do
            visit edit_user_path(user)
            fill_in "Email",    with: user.email
            fill_in "Password", with: user.password
            click_button "Submit"
          end

          describe "after signing in" do

            it "should render the desired protected page" do
              page.should have_selector('title', text: 'Edit Profile')
            end
          end
        end

      end

      describe "in the pahths controller" do

        describe "submitting to the create action" do
          before { post pahths_path }
          specify { response.should redirect_to(login_path) }
        end

        describe "submitting to the destroy action" do
          before { delete pahth_path(FactoryGirl.create(:pahth)) }
          specify { response.should redirect_to(login_path) }
        end

      end


      describe "as wrong user" do
        let(:user) { FactoryGirl.create(:user) }
        let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
        before { sign_in user }

        describe "visiting Users#edit page" do
          before { visit edit_user_path(wrong_user) }
          it { should_not have_selector('title', text: full_title('Edit Profile')) }
        end

        describe "submitting a PUT request to the Users#update action" do
          before { put user_path(wrong_user) }
          specify { response.should redirect_to(login_path) }
        end

      end

    end

  end

end
