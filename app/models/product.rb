class Product < ApplicationRecord
  mount_uploader :thumb,ThumbUploader
  has_many :order_items
  has_many :product_images, dependent: :destroy
  has_many :option_products, dependent: :destroy
  belongs_to :category
  validates :title, presence: true
  validates :price, presence: true, numericality: {only_decimal: true}
  
  before_save :set_status
  accepts_nested_attributes_for :product_images

  
  private
  
  def set_status
    if self.new_record?
      self[:status] = 'Новый'
    else
      self[:status] = 'Обновленный'
    end
  end
  
  
   
    
  
end
