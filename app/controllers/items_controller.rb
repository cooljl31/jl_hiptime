class ItemsController < ApplicationController
  before_action :find_items, onliy: [:create, :update, :edit, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def find_items
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit([:title, :description])
  end
end
