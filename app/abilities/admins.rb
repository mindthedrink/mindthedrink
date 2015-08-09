Canard::Abilities.for(:admin) do
  can [:manage], :all
  can [:assign_roles], User
end
