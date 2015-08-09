require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'roles and abilities' do
    let(:valid_roles) { [:user, :admin] }
    let(:sample_role) { valid_roles.sample }
    let(:user_with_role) { FactoryGirl.build(:user).tap { |u| u.roles << sample_role } }
    let(:user_with_2_roles) { FactoryGirl.build(:user).tap { |u| valid_roles.each { |role| u.roles << role } } }
    let(:user_without_role) { FactoryGirl.build(:user) }

    let(:admin_user) { FactoryGirl.build(:user, :admin) }
    let(:user_user) { FactoryGirl.build(:user, :user) }
    let(:guest_user) { FactoryGirl.build(:user, :guest) }

    describe 'User::VALID_ROLES (order matters)' do
      it do
        expect(User::VALID_ROLES).to eq valid_roles
      end
    end

    describe '#make_admin' do
      it 'add the :admin and :user roles to the user' do
        expect(user_user).not_to be_admin
        user_user.make_admin
        expect(user_user).to be_admin
      end
    end

    describe '#make_user' do
      it 'add the :user role and remove the :admin role to the user' do
        expect(admin_user).to be_admin
        expect(admin_user).to be_user
        admin_user.make_user
        expect(admin_user).not_to be_admin
        expect(admin_user).to be_user
      end
    end

    describe '#has_role?' do
      it 'returns true if the user has the given role assigned' do
        expect(user_with_role.has_role? sample_role).to be_truthy
      end

      it 'returns false if the user has not the given role assigned' do
        expect(user_without_role.has_role? sample_role).to be_falsey
      end
    end

    describe '#admin?' do
      context 'returns true if the user has the role :admin' do
        it 'admin user is admin' do
          expect(admin_user).to be_admin
        end

        it 'user user is not admin' do
          expect(user_user).not_to be_admin
        end

        it 'guest user is not admin' do
          expect(guest_user).not_to be_admin
        end
      end
    end

    describe '#user?' do
      context 'returns true if the user has the role :user' do
        it 'admin user is user' do
          expect(admin_user).to be_user
        end

        it 'user user is user' do
          expect(user_user).to be_user
        end

        it 'guest user is not user' do
          expect(guest_user).not_to be_user
        end
      end

      it 'guest user saved into Database has user role' do
        expect(guest_user).not_to be_user
        guest_user.save!
        expect(guest_user).to be_user
      end
    end

    describe '#roles' do
      it 'returns an empty enumerable in a new User' do
        expect(User.new.roles).to be_empty
      end

      it 'returns a list that includes the roles of the user' do
        expect(user_with_role.roles).to include(sample_role)
      end

      it 'returns a list that includes all the roles of the user' do
        valid_roles.each do |role|
          expect(user_with_2_roles.roles).to include(role)
        end
      end

      context 'modification' do
        shared_examples_for 'User#roles modification' do
          context '#roles#delete' do
            let(:user) { user_with_2_roles }

            it 'affect the has_role? method result' do
              expect(user.has_role? role).to be_truthy
              user.roles.delete value
              expect(user.has_role? role).to be_falsey
            end

            it 'can be saved and reloaded' do
              expect(user.has_role? role).to be_truthy
              user.roles.delete value
              expect(user.has_role? role).to be_falsey

              user.save!
              u = User.where(email: user.email).first!
              expect(u.has_role? role).to be_falsey
            end
          end

          context '#roles#add' do
            let(:user) { user_without_role }

            it 'affect the has_role? method result' do
              expect(user.has_role? role).to be_falsey
              user.roles.add value
              expect(user.has_role? role).to be_truthy
            end

            it 'can be saved and reloaded' do
              user.roles.add value
              user.save!
              u = User.where(email: user.email).first!
              expect(u.has_role? role).to be_truthy
            end
          end

          context 'assign array' do
            let(:user) { user_without_role }
            it 'affect the has_role? method result' do
              expect(user.has_role? role).to be_falsey
              user.roles = [value]
              expect(user.has_role? role).to be_truthy
            end

            it 'can be saved and reloaded' do
              expect(user.has_role? role).to be_falsey
              user.roles = [value]
              expect(user.has_role? role).to be_truthy

              user.save!
              u = User.where(email: user.email).first!
              expect(u.has_role? role).to be_truthy
            end
          end
        end

        context 'using a symbol value' do
          it_behaves_like 'User#roles modification' do
            let(:role) { sample_role }
            let(:value) { sample_role }
          end
        end

        context 'using a string value' do
          it_behaves_like 'User#roles modification' do
            let(:role) { sample_role }
            let(:value) { sample_role.to_s }
          end
        end
      end
    end
  end

end
