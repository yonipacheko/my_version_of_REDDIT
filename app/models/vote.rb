class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true


  #validates_uniqueness_of :user, scope: [ :voteable_id, :voteable_type ]
  #after_validation :showing_message



  def showing_message
    #if self.user.find_by(User.find(session[:user_id]))
      errors.add(:base, 'A user can vote only once!')

  end
end