require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, 'for users', type: :model do
  abilities_all_read FactoryGirl.build(:user, :user)

  let(:u) { FactoryGirl.build(:user, :user) }

  subject { Ability.new(u) }

  describe 'on User' do
    it { should_not be_able_to(:assign_roles, u) }
  end
end

