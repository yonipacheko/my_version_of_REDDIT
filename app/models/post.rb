class Post < ActiveRecord::Base

  BADWORDS =  ['bad', 'words']

  #belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :user
  has_many :comments
  has_many :categories, through: :post_categories
  has_many :post_categories

  #validates :title, presence: true

  # OBS! this is a custom validation

  validate :bad_words  # pay atention at validate is in SINGULAR,

  #custom validation ex:

  def bad_words
    title.split(' ').each do |word|

      if BADWORDS.include?(word)
        errors.add(:base, "can't contain bad words")
        break
      end
    end
  end
end

# when u use ':title' instead of ':base, check about the css-class that gets created
#for future style-design, it's an error div.