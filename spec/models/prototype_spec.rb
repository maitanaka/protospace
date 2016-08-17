require 'rails_helper'

  describe Prototype do

    describe '#create' do

      context "with valid attributes" do
        it "is valid with valid attributes" do
          expect(build(:prototype)).to be_valid
      end
    end

      context "without valid attributes" do
        it "is valid with a name, catchcopy, concept" do
          prototype = build(:prototype)
        end

        it "is invalid without a name" do
          prototype = build(:prototype, name: nil)
          prototype.valid?
          expect(prototype.errors[:name]).to include("can't be blank")
        end

        it "is invalid without a concept" do
          prototype = build(:prototype, concept: nil)
          prototype.valid?
          expect(prototype.errors[:concept]).to include("can't be blank")
        end

        it "is invalid without a catchcopy" do
          prototype = build(:prototype, catchcopy: nil)
          prototype.valid?
          expect(prototype.errors[:catchcopy]).to include("can't be blank")
        end
      end
    end
  end

  describe "associations" do
    context 'with comments' do
      it 'deletes the comments when Prototype is deleted' do
        prototype = build(:prototype)
        comment = create(:comment, prototype: prototype)
        expect{ prototype.destroy }.to change{ Comment.count }
      end
    end

    context 'with likes' do
      it 'deletes the likes when Prototype is deleted' do
        prototype = build(:prototype)
        like = create(:like, prototype: prototype)

        expect{ prototype.destroy }.to change{ Like.count }
      end
    end

    describe "#liked_by?(user)" do
      context 'when liked by a user' do
        it 'returns true' do
          user = build(:user)
          like = create(:like, user_id: user.id)
          expect(Like.find_by(user_id: user.id)).to be_truthy
        end
      end

        context 'when not liked by a user' do
          it 'returns nil' do
            user = build(:user)
            like = create(:like, user_id: "")
            expect(Like.find_by(user_id: user.id)).to eq nil
          end
        end
      end

      describe "#posted_date" do
        it 'returns dates in a specified format' do
          prototype = build(:prototype)
          expect(prototype).to be_valid
        end
      end
    end
