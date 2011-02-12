#by using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                   "Ray Rogers"
  user.email                  "ray@rayonrails.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
  
  Factory.sequence :email do |n|
    "person-#{n}@example.com"
  end
  
end