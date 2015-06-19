class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used(20)
    # The tags for all users and habits.
    @special_tags = ActsAsTaggableOn::Tag.includes(:taggings)
                                         .where('taggings.taggable_type' => ['Habit','User'])
                                         .most_used(10)
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end
end
