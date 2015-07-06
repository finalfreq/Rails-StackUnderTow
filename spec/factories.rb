FactoryGirl.define do
  factory(:user) do
    name('betty')
    email('betty@gmail.com')
    password('badpass123')
  end
end
