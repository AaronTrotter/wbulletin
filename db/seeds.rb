# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tech = FeedCategory.create name: "Technology"
code = FeedCategory.create name: "Programming", parent: tech

science = FeedCategory.create name: "Science"
physics = FeedCategory.create name: "Physics", parent: science

popsci  = Feed.create url: "http://www.popsci.com/rss.xml", category: physics
nettuts = Feed.create url: "http://net.tutsplus.com/feed",  category: code