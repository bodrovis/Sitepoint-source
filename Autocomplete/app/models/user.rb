class User < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_full_name, against: [:name, :surname],
                  using: {
                      tsearch: {
                          prefix: true,
                          negation: true,
                          highlight: {
                              start_sel: '<b>',
                              stop_sel: '</b>',
                          }
                      }
                  }
end