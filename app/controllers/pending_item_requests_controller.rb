class PendingItemRequestsController < ApplicationController
  before_action :set_pending_item_request, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session

  # GET /pending_item_requests
  # GET /pending_item_requests.json
  def index
    #@ending_item_requests = PendingItemRequest.find_by_user_id(Session[user_id])
    @pending_item_requests = PendingItemRequest.all
    render json: @pending_item_requests
  end

  # GET /pending_item_requests/1
  # GET /pending_item_requests/1.json
  def show
    @pending_item_requests = PendingItemRequest.find(params[:id])
    render json: @pending_item_request
  end

  # GET /pending_item_requests/new
  def new
    @pending_item_request = PendingItemRequest.new
  end

  # GET /pending_item_requests/1/edit
  def edit
  end

  # POST /pending_item_requests
  # POST /pending_item_requests.json
  def create
    @pending_item_request = PendingItemRequest.new(pending_item_request_params) #Remember to add session here

    respond_to do |format|
      if @pending_item_request.save
        format.html { redirect_to @pending_item_request, notice: 'Pending item request was successfully created.' }
        format.json { render :show, status: :created, location: @pending_item_request }
      else
        format.html { render :new }
        format.json { render json: @pending_item_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pending_item_requests/1
  # PATCH/PUT /pending_item_requests/1.json
  def update
    @pending_item_request = PendingItemRequest.find(params[:id])
    respond_to do |format|
      if @pending_item_request.update(pending_item_request_params)
        format.html { redirect_to @pending_item_request, notice: 'Pending item request was successfully updated.' }
        format.json { render :show, status: :ok, location: @pending_item_request }
      else
        format.html { render :edit }
        format.json { render json: @pending_item_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pending_item_requests/1
  # DELETE /pending_item_requests/1.json
  def destroy
    @pending_item_request.destroy
    respond_to do |format|
      format.html { redirect_to pending_item_requests_url, notice: 'Pending item request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pending_item_request
      # @pending_item_request = Pending_Item_Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pending_item_request_params
      # params[:pending_item_request]
      params.require(:pending_item_request).permit(:owner, :lendee, :item_id)
    end
end
