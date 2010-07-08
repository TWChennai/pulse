class FeedbackController < ApplicationController
  def view
    @feedbacks=Feedback.all_feedback
  end

  def give
    @title="Please Give Us Your Feedback"
  end

  def submit
    if params[:email]!="" && params[:changes]!="" && params[:reasons]!=""
      @feedback=Feedback.new(params_from_hash)
      @feedback.save
      flash[:success]="Your Feedback has been saved"
    else
      flash[:error]="Please Fill In All the Details"
    end
    redirect_to :action =>"give"

  end

  private
  def params_from_hash
    feedback_params = {}
    feedback_params[:email]=params[:email]
    feedback_params[:changes_required]=params[:changes]
    feedback_params[:reason_for_changes]=params[:reasons]
    feedback_params
  end
end