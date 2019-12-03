class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :validate_each 

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
 def validate_each
   if CLICKBAIT_PATTERNS.none?{|word| word.match title} 
    errors.add(:title,"must be clickbait")
   end
    # unless value == /\b(Won't Believe|Secret|Top \d|Guess)\b/
    #   record.errors[attribute] << "Title is not clickbaity enough"
    # end
  end



end
