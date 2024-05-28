require 'rails_helper'

describe Snippet do
  before do
    @snippet = FactoryBot.create(:snippet)
  end
  
  describe "validations" do
    it 'is valid with title and code block' do
      expect(@snippet).to be_truthy
    end
  end
end