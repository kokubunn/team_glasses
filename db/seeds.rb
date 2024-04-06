# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# ユーザーデータの作成
User.create(user_name: 'しゅん', email: 'shun@example.com', password: 'password')
User.create(user_name: 'よしゆき', email: 'yoshiyuki@example.com', password: 'password')
User.create(user_name: 'こうへい', email: 'kouhei@example.com', password: 'password')

# 10個のタスクの作成
10.times do |i|
  Task.create(
    title: "task#{i+1}",
    points: rand(3..8)
    )
end

# 20個のタスクとユーザーの関連付けの作成
20.times do
  UserTask.create(
    user_id: rand(1..3),
    task_id: rand(3..8)
    )
end
