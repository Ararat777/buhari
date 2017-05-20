class Order < ApplicationRecord
  has_many :order_items
  belongs_to :order_status
  before_create :set_order_status
  before_save :update_total_price
  
  
  
  
  def total_price
    order_items.collect{|item| item.valid? ? item.unit_price * item.quantity : 0}.sum
  end
  
  private
  
  def set_order_status
    self.order_status_id = 1
  end
  
  def update_total_price
    self[:total_price] = total_price
  end
end
