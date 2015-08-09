Canard::Abilities.for(:user) do

  can [:read], :all
  can [:create], User

  can [:manage], User do |u|
    u == user
  end

  cannot [:assign_roles], User
end
