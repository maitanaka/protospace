require 'rails_helper'

  describe Image do

    describe '#create' do

      describe "with valid attributes" do
        it "has a valid factory" do
          image = build(:image, :main)
          expect(image).to be_valid
        end
      end

      describe "without content attribute" do
        it "returns error" do
          image = build(:image, image_url: nil)
          image.valid?
          expect(image.errors[:image_url]).to include("can't be blank")
        end
      end

      describe "without status attribute" do
        it "returns error" do
          image = build(:image, status: nil)
          image.valid?
          expect(image.errors[:status]).to include("can't be blank")
        end
      end
    end
  end
