class User < ActiveRecord::Base
  acts_as_taggable
  acts_as_tagger
end
