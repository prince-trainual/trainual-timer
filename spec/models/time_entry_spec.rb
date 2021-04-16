require 'rails_helper'

RSpec.describe TimeEntry, type: :model do
  describe "only one running" do
    let(:user) { FactoryBot.create(:user) }

    context "when timer isn't running" do
      it "should allow run timer" do
        timer = user.time_entries.create(starts_at: Time.now)

        expect(timer.persisted?).to eq(true)
      end  
    end

    context "when timer is running" do
      before { FactoryBot.create(:time_entry, user: user) }

      it "shoudn't allow run new timer" do
        timer = user.time_entries.create(starts_at: Time.now)

        expect(timer.persisted?).to eq(false)
      end  
    end  
  end  
end
