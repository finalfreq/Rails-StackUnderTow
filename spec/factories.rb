FactoryGirl.define do
  factory(:user) do
    name('betty')
    email('betty@gmail.com')
    password('badpass123')
  end

  factory(:question) do
    name('what is foo?')
    body('where the hell does foo bar come from?')
  end
end