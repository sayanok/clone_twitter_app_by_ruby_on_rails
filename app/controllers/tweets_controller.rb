class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show destroy ]

  # GET /tweets
  def index
    # あとで直す
    @current_user = User.first
    @tweet = Tweet.new(user_id: @current_user&.id)
    @tweets = Tweet.all
  end

  # GET /tweets/1
  def show
  end

  # GET /tweets/new
  def new
    # あとで直す
    @current_user = User.first
    @tweet = Tweet.new(user_id: @current_user&.id)
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to "/"
    else
      render :new, status: :unprocessable_content
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy!

    respond_to do |format|
      format.html { redirect_to tweets_path, notice: "Tweet was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:tweet_text, :user_id)
    end
end
