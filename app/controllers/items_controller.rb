class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :update, :edit, :destroy]

  def index
    @items = Item.user_login(current_user)
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
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
    if @item.update(item_params)
      redirect_to(item_url)
    else
      render(:edit)
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit([:title, :description])
  end
end
