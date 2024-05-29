class Snippet < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :code_block

  def rendered_code_block
    MARKDOWN.render(self.code_block)
  end
end
