FactoryBot.define do
  factory :cover_letter do
    body { "MyText" }
  end

  factory :profession do
    company { "MyString" }
    website { "MyString" }
    title { "MyString" }
    job_url { "MyString" }
    status { 1 }
  end

end
