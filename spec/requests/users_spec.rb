require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    subject{get(users_path)}
    before{ create_list(:user, 3) }

    fit "ユーザーの一覧が取得できる" do
      # get users_path
      subject
      res = JSON.parse(response.body)
      binding.pry
      expect(res.length).to eq 3
      expect(res[0].keys).to eq  ["account", "name" , "email"]

      # 下の２つは同じ内容
      expect(response).to eq have_http_status(200)
      # expect(response.status).to eq 200
    end
  end

  describe "GET /users/:id" do
    it "任意のユーザーのレコードが取得できる" do
    end
  end

  describe "POST /users" do
    it "ユーザーのレコードを作成できる" do
    end
  end

  describe "PATCH(PUT) /users/:id" do
    it "任意のユーザーのレコードを更新できる" do
    end
  end

  describe "DELETE /users:id" do
    it "任意のユーザーのレコードを削除できる" do
    end
  end
end
