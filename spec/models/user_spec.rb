require 'rails_helper'

RSpec.describe User, type: :model do
  context "account を指定しているとき" do
    fit "ユーザーが作られる" do
      binding.pry
      user = build(:user)
      # user = User.new(name: "foo", account: "foo", email: "foo@example.com")
      # expect(user.valid?).to eq true
      expect(user).to be_valid
    end
  end

  context "account を指定していないとき" do
    it "ユーザー作成に失敗する" do
      user = build(:user,account: nil)
      # user = User.new(name: "foo",email: "foo@example.com")
      expect(user).to be_invalid
      expect(user.errors.details[:account][0][:error]).to eq :blank
    end
  end

  # context "同じ名前の account が存在しないとき" do
  #   it "ユーザーが作られる" do
  #     user = User.new(name: "foo", account: "foo", email: "foo@example.com")
  #     expect(user).to be_invalid
  #   end
  # end

  context "まだ同じ名前の account が存在するとき" do
    before{create(:user,account: "foo")}

    it "ユーザー作成に失敗する" do
      user = FactoryBot.build(:user,account: "foo")
      # User.create(name: "foo", account: "foo", email: "foo@example.com")
      # FactoryBot.create(:user,account: "foo")

      # user = User.new(name: "bar", account: "foo", email: "bar@example.com")

      expect(user).to be_invalid
      expect( user.errors.details[:account][0][:error]) .to eq :taken
    end
  end
end
