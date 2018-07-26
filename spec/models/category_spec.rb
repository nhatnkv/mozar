# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  level      :integer
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category do
  describe '.validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(200) }
  end

  describe '.association' do
    it { is_expected.to have_many(:children) }
    it { is_expected.to have_many(:products) }
    it { is_expected.to belong_to(:parent) }
  end

  describe '#set level' do
    context 'when parent_id == nil' do
      it 'return level 1' do
        category = build(:category, parent_id: nil)
        expect(category.level).to eq(Category::LEVEL[:root])
      end
    end

    context 'when parent_id present, not children' do
      it 'return level 3' do
        root_category = create(:category, parent_id: nil)
        category = create(:category, parent_id: root_category.id)
        expect(category.level).to eq(Category::LEVEL[:small])
      end
    end

    context 'when parent_id present, not children' do
      it 'return level 3' do
        root_category = create(:category, parent_id: nil)
        category = create(:category, parent_id: root_category.id)
        child_category = build(:category, name: 'child', parent_id: category.id)
        child_category.save
        expect(Category.find(category.id).level).to eq(Category::LEVEL[:medium])
      end
    end
  end
end
