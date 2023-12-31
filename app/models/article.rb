class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum:6, maximum:12}
    validates :description, presence: true, length: {minimum:10, maximum:50}
  
end
