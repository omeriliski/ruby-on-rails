class TireJob < ApplicationJob
  queue_as :default

  def perform(tire)
    unless tire.nil?
      newPrice = tire.price * 1.1
      tire.update(price: newPrice)
      puts "Tire price updated to #{newPrice}"
    end
  end
end
