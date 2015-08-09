class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #roles: for bitmask! new roles TO THE END!
  VALID_ROLES = [:user, :admin]
  acts_as_user roles: VALID_ROLES


  def admin?
    has_role?(:admin)
  end

  def user?
    has_role?(:user)
  end

  def make_admin
    self.roles.add(:user)
    self.roles.add(:admin)
    self
  end

  def make_user
    self.roles.add(:user)
    self.roles.delete(:admin)
    self
  end

  before_save :check_non_empty_roles

  private
  def check_non_empty_roles
    self.roles.add(:user) if self.roles.empty?
  end
end
