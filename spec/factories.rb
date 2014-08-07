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

	factory :discussion do
		sequence(:title) { |n| "Example title #{n}" }
	end
end
