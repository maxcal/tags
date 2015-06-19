class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used(20)
    # The tags for all users and habits.
    @special_tags = ActsAsTaggableOn::Tag.includes(:taggings)
                                         .where('taggings.taggable_type' => ['Habit','User'])
                                         .most_used(10)
    # to get tags where the current user is the tagger
    @user_tags = current_user.tags
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end

  private

  # Just a hack for demonstration purposes
  def current_user
    User.first
  end
end