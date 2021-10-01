FactoryBot.define do
  factory :user do
    nickname                 {"test"}
    email                    {Faker::Internet.free_email}
    password                 {"1a"+Faker::Internet.password(min_length: 4)}
    password_confirmation    {password}
    family_name              {"檸檬"}
    family_name_kana         {"レモン"}
    first_name               {"蜜柑"}
    first_name_kana          {"ミカン"}
    birth_date               {"2000-01-01"}
  end
end