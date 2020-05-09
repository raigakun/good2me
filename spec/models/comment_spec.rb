require 'rails_helper'

describe Comment do
  describe '#create' do

    it "titleがない場合はコメントできないこと" do
      comment = build(:comment, title: nil)
      comment.valid?
      expect(comment.errors[:title]).to include("は1文字以上で入力してください")
    end

    it "memoがない場合はコメントできないこと" do
      comment = build(:comment, memo: nil)
      comment.valid?
      expect(comment.errors[:memo]).to include("は1文字以上で入力してください")
    end


  end
end
