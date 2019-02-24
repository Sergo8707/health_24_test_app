class CommitsController < ApplicationController
  def index
    @commits = (@user ? @user.commits : Commit).order(:date).page params[:page]
    respond_with(@commits)
  end
end
