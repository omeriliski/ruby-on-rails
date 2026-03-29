class Brand < ApplicationRecord
    has_many :tires

    validates :name, presence: true, length: { minimum: 2, maximum: 50 }
end
