FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "テスト記事#{n}" }
    body { "これはテスト記事の内容です。" }
    curriculum { "テスト記事のカリキュラムです。" }
    association :user
  end
end
