class TopController < ApplicationController
  def index
    @tasks = Task.where(user: current_user).order("created_at ASC")
    # @tasks = Task.where(group: current_group).order("created_at ASC")
  end
end
