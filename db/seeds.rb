BackpackItem.destroy_all

Item.destroy_all
%w(Apfelkitsch Altmetall).each do |name|
  Item.create!(name: name)
end

User.destroy_all
user1 = User.create!(
  email:                 "fate@primus-fatum.de",
  password:              "install123",
  password_confirmation: "install123",
  confirmed_at:          DateTime.now
)

user1.backpack = Item.all
