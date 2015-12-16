class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session


  # GET /items
  # GET /items.json
  def index
    #@items = Item.find_by_user_id(Session[user_id])
    @items = Item.all
    render json: @items
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @items = Item.find(params[:id])
    render json: @items
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params) #Remember to add Session[user_id]
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @item = Item.find(item_params)
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.name, status: :unprocessable_entity }
        # format.html { render json: @item, notice: 'Item was not successfully updated.' }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      # format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      #params[:item]
      params.require(:item).permit(:name, :weight,:description,:user_id)
    end

    def searchItem
    search do
      Item.where :name => params[:q]
    end
  end

  private

  def search(&block)    
    if params[:q]
      @results = yield if block_given?

      respond_to do |format|
        format.html # resources.html.erb
        format.json { render json: @results }
      end
    else
      redirect_to root_url, :notice => 'No search query was specified.'
    end
  end

  def findMyItems
    myItems = @items.where(user_id: @user.id)
    render json: myItems
  end
end