class PendingRequestsController < ApplicationController
  before_action :set_pending_request, only: [:show, :edit, :update, :destroy]

  # GET /pending_requests
  # GET /pending_requests.json
  def index
    @pending_requests = PendingRequest.all
  end

  # GET /pending_requests/1
  # GET /pending_requests/1.json
  def show
  end

  # GET /pending_requests/new
  def new
    @pending_request = PendingRequest.new
  end

  # GET /pending_requests/1/edit
  def edit
  end

  # POST /pending_requests
  # POST /pending_requests.json
  def create
    @pending_request = PendingRequest.new(1,pending_request_params)

    respond_to do |format|
      if @pending_request.save
        format.html { redirect_to @pending_request, notice: 'Pending request was successfully created.' }
        format.json { render :show, status: :created, location: @pending_request }
      else
        format.html { render :new }
        format.json { render json: @pending_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pending_requests/1
  # PATCH/PUT /pending_requests/1.json
  def update
        @pending_request = PendingRequest.find(params[:id])
    respond_to do |format|
      if @pending_request.update(pending_request_params)
        format.html { redirect_to @pending_request, notice: 'Pending request was successfully updated.' }
        format.json { render :show, status: :ok, location: @pending_request }
      else
        format.html { render :edit }
        format.json { render json: @pending_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pending_requests/1
  # DELETE /pending_requests/1.json
  def destroy
    @pending_request.destroy
    respond_to do |format|
      format.html { redirect_to pending_requests_url, notice: 'Pending request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pending_request
      @pending_request = PendingRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pending_request_params
      # params[:pending_request]
       params.require(:pending_request).permit(:item_id)
    end
end
