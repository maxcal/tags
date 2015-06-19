# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# So for our tags we use some random Ipsum Loren words.
# We use this as a kind of shared repostory of tags so that we get overlap
$tags = Faker::Lorem.words(200)

[User, Goal, Habit, Valuation, Quantified].each do |model|
  unless model.any?
    print "Creating 10 #{model.model_name.plural }: "
    10.times do
      obj = model.new
      obj.tag_list.add( $tags.sample(8) )
      obj.tag_list.add( 'lol')  unless model == User || model == Habit
      obj.save!
      print "."



    end
    puts "done"
  end


end

current_user = User.first

Goal.all.each { |goal| current_user.tag(goal, :with => Faker::Lorem.words, :on => :tags ) }



