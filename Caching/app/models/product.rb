class Product < ApplicationRecord
  after_commit :flush_cache

  class << self
    def all_cached
      Rails.cache.fetch("products") { Product.all }
    end
  end

  private

  def flush_cache
    Rails.cache.delete('products')
  end
end
