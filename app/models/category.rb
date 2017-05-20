class Category < ApplicationRecord
  has_many :products
  has_many :option_products
  validates :title, presence: true
  validates :seo_url, presence: true
end
