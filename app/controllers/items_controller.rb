class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :destroy]

  expose_decorated :item
  expose_decorated :items, -> { fetch_items }

  def create
    if item.save
      redirect_to item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if item.update(item_params)
      redirect_to item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    item.destroy
      redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private

    def fetch_items
      items = Item.all
      items
    end

    def item_params
      params.require(:item).permit(:title, :description, :tag_id)
    end
end
