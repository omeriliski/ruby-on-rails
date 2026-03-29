class Tire < ApplicationRecord
    has_one_attached :tire_image

    after_create :log_after_create   # method that runs after a record is created
    # before_create // method that runs before a record is created

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    validates :brand, presence: true, length: { minimum: 2, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 250 }
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :sku, presence: true
    validates :season, presence: true, inclusion: { in: %w[summer winter all-season] }
    validates :list_price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
    validates :width, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :height, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validate :inch_starts_with_R

    def inch_starts_with_R
        if !self.inch.start_with?("R")
            errors.add(:inch, "must start with 'R'")
        end
    end

    # after_save : // method that runs after a record is saved 
    # before_save // method that runs before a record is saved
    # after_save // method that runs after a record is saved
    # before_destroy // method that runs before a record is destroyed
    # after_destroy // method that runs after a record is destroyed
    # before_update // method that runs before a record is updated
    # after_update // method that runs after a record is updated

    def log_after_create
        p "tire is successfully created with id: #{self.id}"
    end
end
