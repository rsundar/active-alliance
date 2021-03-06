class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show; end

  def personal
    @personal_activities = Activity.most_recent.includes(:author, groups: [icon_attachment: :blob]).where(author_id:
      @user.id)
  end

  def external
    @external_activities = Activity.most_recent.no_group.includes(:author, :groups).where(author_id: @user.id)
  end

  private

  def set_user
    @user = current_user
  end
end
