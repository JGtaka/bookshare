require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      article = build(:article)
      expect(article).to be_valid
      expect(article.errors).to be_empty
    end

    it 'titleがない場合にバリデーションが機能してinvalidになるか' do
      article_without_title = build(:article, title: '')
      expect(article_without_title).to be_invalid
      expect(article_without_title.errors[:title]).to eq ["を入力してください"]
    end

    it 'bodyがない場合にバリデーションが機能してinvalidになるか' do
      article_without_body = build(:article, body: nil)
      expect(article_without_body).to be_invalid
      expect(article_without_body.errors[:body]).to eq ["を入力してください"]
    end

    it 'curriculumがない場合にバリデーションが機能してvalidになるか' do
      article_without_curriculum = build(:article, curriculum: nil)
      expect(article_without_curriculum).to be_valid
      expect(article_without_curriculum.errors[:curriculum]).to be_empty
    end
  end
end
