Item.delete_all
%w(Apfelkitsch Altmetall).each do |name|
  Item.create!(name: name)
end

User.delete_all
User.create!(
  email:                 "fate@primus-fatum.de",
  password:              "install123",
  password_confirmation: "install123",
  confirmed_at:          DateTime.now
)
