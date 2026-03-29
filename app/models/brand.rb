class Brand < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2, maximum: 50 }
end
