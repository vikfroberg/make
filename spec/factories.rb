FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "user#{n}@example.com" }
		password "password"
	end

	factory :project do
	end

	factory :task do
	end

	factory :todo do
	end
end
