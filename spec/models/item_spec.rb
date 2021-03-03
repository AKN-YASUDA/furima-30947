require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  context '商品出品ができる時' do
    it ':user :image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipment_date_id, :price が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品できない時' do
    describe "商品出品" do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが40文字以上では登録できない" do
        @item.name = 'あああああああああああああああああああああああああああああああああああああああああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "explanationが空では登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "explanationが1000文字以上では登録できない" do
        @item.explanation = '商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、
        商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、
        商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、
        商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、
        商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、
        商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、
        商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、
        商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、
        商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、
        商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文、商品説明文'
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
      end
      it "category_idが1では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "delivery_fee_idが1では登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "prefecture_idが1では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      
      it "shipment_date_idが1では登録できない" do
        @item.shipment_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date must be other than 1")
      end
      it "prefecture_idが1では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299以下だと登録できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10000000以上だと登録できない" do
        @item.price = 20000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end
end
