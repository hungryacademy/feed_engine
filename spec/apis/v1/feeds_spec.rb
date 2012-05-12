require 'spec_helper'

describe 'api/v1/feed', type: :api do
  let!(:user) { FactoryGirl.create(:user_with_growls) }
  let!(:token) { user.authentication_token }
  let!(:other_user) { FactoryGirl.create(:user_with_growls) }
  
  context "growls viewable by this user" do
    let(:url) { "http://api.hungrlr.com/v1/feeds/#{user.display_name}" }
    before(:each) do
      get "#{url}.json"
    end
    describe "json" do
      it "returns a successful response" do
        last_response.status.should == 200
      end
      it "returns only the specified users growls" do
        growls_json = user.growls.to_json
        last_response.body.should == growls_json
      end
    end
  end
end
