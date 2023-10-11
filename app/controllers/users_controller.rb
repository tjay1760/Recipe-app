# rubocop:disable all

# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    # Retrieve a list of users (e.g., User.all) and assign it to an instance variable
    @users = User.all
  end

  def show
    # The "set_user" method (defined below) fetches the user by ID, and we assign it to an instance variable
    # This action will display the details of a specific user
  end

  # Define other actions as needed

  private

  def set_user
    @user = User.find(params[:id])
  end
end
