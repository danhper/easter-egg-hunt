# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

names = %w[Daniel Sam Max Chase Paul Louis Olivier]

names.each do |name|
  email = "#{name.downcase}@mero.finance"
  User.create_with(name:, admin: name == "Olivier").find_or_create_by!(email:)
end

RULES = <<RULES
# Easter Egg Hunt Rules

There are __EGGS_NUMBER__ Easter eggs hidden in the wedding venue.
The winner will be the person that earns the most points finding the eggs.

Points are distributed as follows: the first person to find a point receives 7 points, the second 6 points, etc.
The position of a person is determined by the time they submit their answer.
Note that any edit of an existing answer will reset the submission time to the edit time.
Once an answer is submitted, I will validate or reject the answer.
If an answer is rejected, a new answer can be resubmitted, but the submission time will be reset.

Hints will be added as the hunt progresses.
All participants will receive an email notification when a hint is added.

Good luck!

RULES

Settings.create(rules: RULES) unless Settings.any?
