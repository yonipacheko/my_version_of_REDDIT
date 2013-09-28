class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :categories, through: :post_categories

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  def admin?
    self.role == 'admin'
  end

end
