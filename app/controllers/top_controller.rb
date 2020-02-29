class TopController < ApplicationController
  def index
    @tasks = Task.where(user: current_user).order("created_at ASC")
    # @tasks = Task.where(group_url).order("created_at ASC")
  end
end
