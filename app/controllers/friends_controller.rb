class FriendsController < ApplicationController
   before_action :set_friend, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session

  # GET /friends
  # GET /friends.json
  def index
    friendsId = Friend.find_by_user_id(Session[user_id])
    @friends = User.find(friendsId.buddy)

    render json: @friends
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    @friend = Friend.find_by_buddy(params[:id])
    render json: @friend.buddy
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json

  #follow
  def create
    @friend = Friend.new(friend_params)

    respond_to do |format|
      if @friend.save
        #format.html { redirect_to @friend, notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        # format.html { render :new }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  # def update
  #   respond_to do |format|
  #     if @friend.update(friend_params)
  #       format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @friend }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @friend.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /friends/1
  # DELETE /friends/1.json

  #Unfollow
  def destroy
      friendsId = Friend.where(:user_id => 3 , :buddy =>params[:id]).pluck(:id)
      # friend=Friend.find(friendsId)
      Friend.destroy(friendsId)
      respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend1 = Friend.find_by_buddy(params[:id])
      @friendDestroy = Friend.find_by_user_id(@friend1)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:user_id,"buddy")
    end
end
