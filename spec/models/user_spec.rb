require 'rails_helper'
describe User do
  describe '#create' do
    it "全項目があれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nicknameがない時のエラー" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "emailがない時のエラー" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "passwordがない時のエラー" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "password_confirmationがない時のエラー" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "nicknameが7文字以上であれば登録できないこと" do
      user = build(:user, nickname: "abeabea")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long")
    end
    it "nicknameが6文字以下では登録できること" do
      user = build(:user, nickname: "abeabe")
      user.valid?
      expect(user).to be_valid
    end
    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end
    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end

# require 'rails_helper'
# describe User do
#   describe '#create' do
#     it "nicknameがない時のエラー" do
#       user = build(:user, nickname: nil)
#       user.valid?
#       expect(user.errors[:nickname]).to include("can't be blank")
#     end
#   end
# end

# describe User do
#   describe '#create' do
#     it "emailがない時のエラー" do
#       user = build(:user, email: nil)
#       user.valid?
#       expect(user.errors[:email]).to include("can't be blank")
#     end
#   end
# end
