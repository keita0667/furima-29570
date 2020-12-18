require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
     
     it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      expect(@user).to be_valid
     end
     it "パスワードは6文字以上であれば登録できる。" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      expect(@user).to be_valid
     end
     it "性(漢字)は全角文字で登録する必要がある。" do
      @user.lastname_kanji = "あああ"
      expect(@user).to be_valid
     end
     
     it "名(漢字)は全角文字で登録する必要がある。" do
      @user.firstname_kanji = "あああ"
      expect(@user).to be_valid
     end
     
     it "性(カナ)は全角文字で登録する必要がある。" do
      @user.lastname_kana = "カナ"
      expect(@user).to be_valid
     end
     
     it "名(カナ)は全角文字で登録する必要がある。" do
      @user.firstname_kana = "カナ"
      expect(@user).to be_valid
     end
    end

     context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
       end
       it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
       end
       it "パスワードが空では登録できない。" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
       end
      #  it "パスワードは文字と数字を含んでなければ登録できない。" do
      #   @user.password = "あいうえおか"
      #   @user.valid?
      #   binding.pry
      #   expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      #  end
       it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end
       it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
       end
       it "誕生日が空では登録できない。" do
        @user.birth_year = ""
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Password can't be blank")
       end
       it "性(漢字)が空では登録できない。" do
       end
       it "名(漢字)が空では登録できない。" do
       end
       it "性(カナ)は空では登録できない。" do
       end
       it "名(カナ)は空では登録できない。" do
       end
     end

   end
 end