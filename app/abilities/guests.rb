Canard::Abilities.for(:guest) do
  can [:read], :all
  can [:create], User
  cannot [:assign_roles], User
end
