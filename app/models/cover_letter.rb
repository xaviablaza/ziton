class CoverLetter < ApplicationRecord
  has_many :professions

  def body_formatted(title, company)
    formatted = body.gsub! '<title>', title
    formatted.gsub! '<company>', company
  end
end
