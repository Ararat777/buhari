class OptionProduct < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true, numericality: {only_decimal: true}
  belongs_to :product
  belongs_to :category
  has_many :order_items, as: :product
  mount_uploader :thumb,ThumbUploader
end
