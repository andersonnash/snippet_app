FactoryBot.define do
  factory :snippet do
    title { "Some Title" }
    code_block { "puts 'Hello, World!'" }
    description { "A simple Ruby snippet" }
    association :user
  end
end
