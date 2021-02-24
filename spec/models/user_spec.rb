require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが登録済みのものと同じだと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Password is invalid')
    end
    it "emailが@を含んでないと登録できない" do
      user = FactoryBot.build(:user) 
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it "passwordが空だと登録できない" do
      user = FactoryBot.build(:user) 
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが６文字以下だと登録できない" do
      @user.password = '111aa'
      @user.password_confirmation = '111aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "passwordが全て半角数字のみだと登録できない" do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが全て半角英字のみだと登録できない" do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "password_confirmationが空だと登録できない" do
      user = FactoryBot.build(:user) 
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordとpassword_confirmationが一致しないと登録できない" do
      user = FactoryBot.build(:user) 
      @user.password = '123abc'
      user.password_confirmation = '246def'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空だと登録できない" do
      user = FactoryBot.build(:user) 
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      user = FactoryBot.build(:user) 
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "kana_lastnameが空だと登録できない" do
      user = FactoryBot.build(:user) 
      @user.kana_lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana lastname can't be blank")
    end
    it "kana_firstnameが空だと登録できない" do
      user = FactoryBot.build(:user) 
      @user.kana_firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana firstname can't be blank")
    end
    it "birth_dayが空だと登録できない" do
      user = FactoryBot.build(:user) 
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end