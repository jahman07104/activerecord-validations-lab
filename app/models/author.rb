class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { minimum: 0 }
  validates :name, uniqueness: true
  validates :phone_number, length: { is: 10 }
end
