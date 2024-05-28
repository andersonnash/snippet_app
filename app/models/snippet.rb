class Snippet < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :code_block
end
