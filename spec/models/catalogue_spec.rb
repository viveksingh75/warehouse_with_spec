# spec/models/catalogue_spec.rb
require 'rails_helper'

RSpec.describe Catalogue, type: :model do
  describe 'ransackable_attributes' do
    it 'includes attributes' do
      ransackable_attributes = Catalogue.ransackable_attributes
      expected_attributes = %w[id name created_at updated_at]

      expect(ransackable_attributes).to match_array(expected_attributes)
    end
  end
end
