class EstimateItem < ApplicationRecord
  has_many :estimate_products
  has_ancestry
end
