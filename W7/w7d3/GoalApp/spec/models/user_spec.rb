require 'rails_helper'

RSpec.describe User, type: :model do
  #validations
  it {should validate_presence_of(:username)}
  it {should validate_length_of(:password).is_at_least(6)}

  subject(:capy){FactoryBot.create(:user)}
  # FactoryBot.build(:user, username: ‘capy’, password: ‘password’)
  # subject(:capy) { User.create(
  #   username: 'capy',
  #   password: 'password'
  # )}
  it {should validate_uniqueness_of(:username)}

  #associations
end
