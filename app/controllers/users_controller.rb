class UsersController < ApplicationController
  before_action :authenticate_user!

  def choose_school
  end

  def choose_school_set
    current_user.school = School.find(params[:school_id])
    current_user.save

    redirect_to root_path
  end

end
