# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

root = Page.create();
imm = Page.create({url: 'immigration', parent_id: root.id})
brexit = Page.create({url: 'brexit', parent_id: imm.id})
why = Page.create({url: 'why-is-it-even-a-thing', parent_id: brexit.id})
Page.create({url: 'david-icke', parent_id: why.id})
Page.create({url: 'blue-passport', parent_id: why.id})
Page.create({url: 'the-olds', parent_id: why.id})
passport = Page.create({url: 'passports', parent_id: imm.id});
Page.create({url: 'david-ickes-passport-number', parent_id: passport.id});
oldpassport = Page.create({url: 'old-passports', parent_id: passport.id});
Page.create({url: 'shouldnt-they-be-burgandy', parent_id: oldpassport.id});
Page.create({url: 'they-were-always-blue-in-the-home-counties', parent_id: oldpassport.id});
