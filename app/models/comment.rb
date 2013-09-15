class Comment < ActiveRecord::Base
  belongs_to :creater, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post
end
