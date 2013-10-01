class Post   < ActiveRecord::Base

  include VoteableFerSept, SlugFerGem

  BADWORDS =  ['bad', 'words']

  #belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :user
  has_many :comments
  has_many :categories, through: :post_categories
  has_many :post_categories

  validates :title, presence: true

  # OBS! this is a custom validation

  validate :bad_words  # pay attention at validate is in SINGULAR,
  after_validation :generate_slug


  #custom validation ex:
  def bad_words
    title.split(' ').each do |word|

      if BADWORDS.include?(word)
        errors.add(:base, "can't contain bad words")
        break
      end
    end
  end

  #All the functions bellow became 2 different gems (^:^)

  #def total_votes
  #  self.votes.where(vote: true).size - self.votes.where(vote: false).size
  #end

  #def generate_slug
  #  self.slug = self.title.gsub(' ','-').downcase
  #end
  #
  #def to_param
  #  self.slug
  #end




end



# when u use ':title' instead of ':base, check about the css-class that gets created
#for future style-design, it's an error div.