require 'rails_helper'

RSpec.describe "/shoes", type: :request do

  let(:valid_attributes) do {
    name: FFaker::Lorem.word,
    description: FFaker::Lorem.sentences
  }
  end

  let(:invalid_attributes) do {
    name: nil,
    description: FFaker::Lorem.sentences
  }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Shoe.create! valid_attributes
      get shoes_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      shoe = Shoe.create! valid_attributes
      get shoe_url(shoe), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Shoe" do
        expect {
          post shoes_url,
               params: { shoe: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Shoe, :count).by(1)
      end

      it "renders a JSON response with the new shoe" do
        post shoes_url,
             params: { shoe: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Shoe" do
        expect {
          post shoes_url,
               params: { shoe: invalid_attributes }, as: :json
        }.to change(Shoe, :count).by(0)
      end

      it "renders a JSON response with errors for the new shoe" do
        post shoes_url,
             params: { shoe: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do {
        name: FFaker::Lorem.word
      }
      end

      it "updates the requested shoe" do
        shoe = Shoe.create! valid_attributes
        patch shoe_url(shoe),
              params: { shoe: new_attributes }, headers: valid_headers, as: :json
        shoe.reload
        expect(shoe.name).to eq new_attributes[:name]
      end

      it "renders a JSON response with the shoe" do
        shoe = Shoe.create! valid_attributes
        patch shoe_url(shoe),
              params: { shoe: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the shoe" do
        shoe = Shoe.create! valid_attributes
        patch shoe_url(shoe),
              params: { shoe: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested shoe" do
      shoe = Shoe.create! valid_attributes
      expect {
        delete shoe_url(shoe), headers: valid_headers, as: :json
      }.to change(Shoe, :count).by(-1)
    end
  end
end
