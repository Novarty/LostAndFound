class Question < ApplicationRecord
  belongs_to :item , optional: true
end
