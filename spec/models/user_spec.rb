require 'rails_helper'

RSpec.describe User, type: :model do
  describe "current_timer" do
    let(:user) { FactoryBot.create(:user) }

    context "when no running timers" do
      it "should return nil" do
        expect(user.current_timer).to be_nil
      end
    end

    context "when running timer" do
      let!(:timer) { FactoryBot.create(:time_entry, user: user) }

      it "should return timer" do
        expect(user.current_timer.id).to eq(timer.id)
      end
    end
  end
  
  describe "timer_running?" do
    let(:user) { FactoryBot.create(:user) }

    context "when no running timer" do
      it "should return false" do
        expect(user.timer_running?).to eq(false)
      end
    end

    context "when running timer" do
      let!(:timer) { FactoryBot.create(:time_entry, user: user) }

      it "should return true" do
        expect(user.timer_running?).to eq(true)
      end
    end
  end
end
