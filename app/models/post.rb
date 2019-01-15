class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum:250}
  validates :summary, length: {maximum:250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

    def clickbait
      if self.title.present? && self.title.include?("Won't Believe"||"Secret"||"Guess")
        true
      else
        errors.add(:not_clickbait, "This Title is not clickbait")
      end
    end

end
