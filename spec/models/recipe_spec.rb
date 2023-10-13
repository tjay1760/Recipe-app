# recipe_spec.rb
require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user = User.new(name: 'John Doe')

  subject do
    Recipe.new(user:,
               name: 'Spaghetti Carbonara',
               description: 'A classic Italian pasta dish',
               preparation_time: 20,
               cooking_time: 15)
  end

  before { subject.save }

  it 'should have an user' do
    subject.user = nil
    expect(subject).not_to be_valid
  end

  it 'should have a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'should have a valid preparation time' do
    subject.preparation_time = nil
    expect(subject).not_to be_valid
  end

  it 'should have a valid cooking time' do
    subject.cooking_time = nil
    expect(subject).not_to be_valid
  end
end
