require 'rails_helper'



RSpec.describe "/shoe_items", type: :request do

  let(:valid_attributes) do {
    size: FFaker::Number.number,
    amount: FFaker::Number.number,
    shoe_id: create(:shoe).id
  }
  end

  let(:invalid_attributes) do {
    size: nil,
    amount: FFaker::Number.number,
    shoe_id: create(:shoe).id
  }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      ShoeItem.create! valid_attributes
      get shoe_items_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      shoe_item = ShoeItem.create! valid_attributes
      get shoe_item_url(shoe_item), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ShoeItem" do
        expect {
          post shoe_items_url,
               params: { shoe_item: valid_attributes }, headers: valid_headers, as: :json
        }.to change(ShoeItem, :count).by(1)
      end

      it "renders a JSON response with the new shoe_item" do
        post shoe_items_url,
             params: { shoe_item: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ShoeItem" do
        expect {
          post shoe_items_url,
               params: { shoe_item: invalid_attributes }, as: :json
        }.to change(ShoeItem, :count).by(0)
      end

      it "renders a JSON response with errors for the new shoe_item" do
        post shoe_items_url,
             params: { shoe_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do {
        amount: FFaker::Number.number
      }
      end

      it "updates the requested shoe_item" do
        shoe_item = ShoeItem.create! valid_attributes
        patch shoe_item_url(shoe_item),
              params: { shoe_item: new_attributes }, headers: valid_headers, as: :json
        shoe_item.reload
        expect(shoe_item.amount).to eq new_attributes[:amount]
      end

      it "renders a JSON response with the shoe_item" do
        shoe_item = ShoeItem.create! valid_attributes
        patch shoe_item_url(shoe_item),
              params: { shoe_item: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the shoe_item" do
        shoe_item = ShoeItem.create! valid_attributes
        patch shoe_item_url(shoe_item),
              params: { shoe_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested shoe_item" do
      shoe_item = ShoeItem.create! valid_attributes
      expect {
        delete shoe_item_url(shoe_item), headers: valid_headers, as: :json
      }.to change(ShoeItem, :count).by(-1)
    end
  end
end
