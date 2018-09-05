

class Person < ApplicationRecord
  validates :name, :house_id, presence: true
  belong_to :house, {
    primary_key: :id,
    foreign_key: :house_id,
    class_name: "House"
end
