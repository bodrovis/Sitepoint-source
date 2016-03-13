class Animal < ApplicationRecord
  WHITELIST = ['age', 'name', 'species']

  class << self
    def from_json(entry)
      begin
        Animal.create!(JSON.load(entry.get_input_stream.read).select {|k,v| WHITELIST.include?(k)})
      rescue => e
        warn e.message
      end
    end
  end
end
