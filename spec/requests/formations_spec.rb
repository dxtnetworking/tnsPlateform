require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/formations", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Formation. As you add validations to Formation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    build(:formation).attributes
  }

  let(:invalid_attributes) {
    {
      intitule: nil, 
      niveau: nil, 
      nom_institution: nil,
      localisation: nil,
      localisation: nil, 
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # FormationsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    { "Content-Type": "application/json; charset=utf-8" }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Formation.create! valid_attributes
      get formations_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      formation = Formation.create! valid_attributes
      get formation_url(formation), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Formation" do
        expect {
          post formations_url,
               params: { formation: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Formation, :count).by(1)
      end

      it "renders a JSON response with the new formation" do
        post formations_url,
             params: { formation: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Formation" do
        expect {
          post formations_url,
               params: { formation: invalid_attributes }, as: :json
        }.to change(Formation, :count).by(0)
      end

      it "renders a JSON response with errors for the new formation" do
        post formations_url,
             params: { formation: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        build(:formation).attributes
      }

      it "updates the requested formation" do
        formation = Formation.create! valid_attributes
        patch formation_url(formation),
              params: { formation: new_attributes }, headers: valid_headers, as: :json
        formation.reload
        expect(response).to have_http_status(:ok)
      end

      it "renders a JSON response with the formation" do
        formation = Formation.create! valid_attributes
        patch formation_url(formation),
              params: { formation: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the formation" do
        formation = Formation.create! valid_attributes
        patch formation_url(formation),
              params: { formation: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested formation" do
      formation = Formation.create! valid_attributes
      expect {
        delete formation_url(formation), headers: valid_headers, as: :json
      }.to change(Formation, :count).by(-1)
    end
  end
end