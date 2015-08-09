require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, 'for guests', type: :model do
  abilities_all_read FactoryGirl.build(:user, :user)

  let(:u) { FactoryGirl.build(:user, :guest) }

  subject { Ability.new(u) }

  describe 'on User' do
    it { should be_able_to(:create, u) }
    it { should_not be_able_to(:assign_roles, u) }
  end

end

