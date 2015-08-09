require 'rails_helper'
require 'cancan/matchers'

describe Canard::Abilities, 'for admins', type: :model do

  abilities_all_manage FactoryGirl.build(:user, :admin)

  let(:u) { FactoryGirl.build(:user, :admin) }

  subject { Ability.new(u) }

  describe 'on User' do
    it { should be_able_to(:assign_roles, u) }
    it { should be_able_to(:assign_roles, FactoryGirl.build(:user, :user)) }
  end
end

