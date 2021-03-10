require 'rails_helper'

RSpec.describe FormObject, type: :model do
  describe '購入情報の保存' do
    before do
      @form_object = FactoryBot.build(:form_object)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@form_object).to be_valid
    end
    it 'user_idが空だと保存できないこと' do
      @form_object.user_id = nil
      @form_object.valid?
      expect(@form_object.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @form_object.item_id = nil
      @form_object.valid?
      expect(@form_object.errors.full_messages).to include("Item can't be blank")
    end
    it 'postcodeが空だと保存できないこと' do
      @form_object.postcode = ''
      @form_object.valid?
      expect(@form_object.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcodeにハイフンが含まれていないと保存できないこと' do
      @form_object.postcode = '1234567'
      @form_object.valid?
      expect(@form_object.errors.full_messages).to include("Postcode is invalid")
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @form_object.prefecture_id = 0
      @form_object.valid?
      expect(@form_object.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it 'townが空だと保存できないこと' do
      @form_object.town = ''
      @form_object.valid?
      expect(@form_object.errors.full_messages).to include("Town can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @form_object.house_number = ''
      @form_object.valid?
      expect(@form_object.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @form_object.building_name = ''
      expect(@form_object).to be_valid
    end
    it 'phoneが空だと保存できないこと' do
      @form_object.phone = ''
      @form_object.valid?
      expect(@form_object.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが11桁を超えると保存できないこと' do
      @form_object.phone = '1'*12
      @form_object.valid?
      expect(@form_object.errors.full_messages).to include("Phone is invalid")
    end
  end
end
  
