class OrderItem < ApplicationRecord
  belongs_to :product,polymorphic: true
  belongs_to :order
  validates :quantity,presence: true, numericality: {only_integer: true, greater_than: 0}
  validate :product_present
  validate :order_present
  before_save :finalize
  
  def unit_price
    product.price
  end
  
  def sub_total_price
    unit_price * quantity
  end
  
  private
  
  def product_present
    if product.nil?
      errors.add(:product, 'This product is not valid')
    end
  end
  
  def order_present
    if order.nil?
      errors.add(:order, 'Order is not valid')
    end
  end
  
  def finalize
    self[:unit_price] = unit_price
    self[:sub_total_price] = sub_total_price
  end
end
