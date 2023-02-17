class ShoeItemsController < ApplicationController
  before_action :set_shoe_item, only: %i[ show update destroy ]

  # GET /shoe_items
  def index
    @shoe_items = ShoeItem.all

    render json: @shoe_items
  end

  # GET /shoe_items/1
  def show
    render json: @shoe_item
  end

  # POST /shoe_items
  def create
    @shoe_item = ShoeItem.new(shoe_item_params)

    if @shoe_item.save
      render json: @shoe_item, status: :created, location: @shoe_item
    else
      render json: @shoe_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shoe_items/1
  def update
    if @shoe_item.update(shoe_item_params)
      render json: @shoe_item
    else
      render json: @shoe_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shoe_items/1
  def destroy
    @shoe_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoe_item
      @shoe_item = ShoeItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shoe_item_params
      params.require(:shoe_item).permit(:size, :amount, :shoe_id)
    end
end
