FactoryBot.define do
  factory :time_entry, class: "TimeEntry" do
    starts_at { Time.now }
  end
end
