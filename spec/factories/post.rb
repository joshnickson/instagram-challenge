FactoryGirl.define do
  factory :post do
    caption "#test"
    image Rack::Test::UploadedFile.new(File.join(Rails.root, '/spec/tesla-cat.jpg'))
  end
end

