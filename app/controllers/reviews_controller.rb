class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.find params[:id]

    @user = User.find(params[user:id])
    @review = Review.new
  end

  # new reviews is inside index
  def new
  end

  # GET /reviews/1/edit
  def edit
    @review = @current_review
  end

  def create

      @review = Review.create review_params
      @review.update :user_id => params[:user_id]
      # Who we're reviewing
      @review.update :reviewer_id => @current_user.id
   respond_to do |format|
      if @review.save
        format.html { render :review, :layout => false } #layout false will not render the entire layouts page, we onyl want the reviews here.
        #format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
  end

  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:user_id, :target, :rating, :review)
    end
end
