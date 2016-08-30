require 'rails_helper'

RSpec.describe LandingController, type: :controller do
  describe "show index"do
    it "should show index"do
      get :index
      expect(subject).to render_template(:index)

    end
  end
end
