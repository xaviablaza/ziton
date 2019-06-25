require 'hexapdf'
require 'pry'

include HexaPDF::Layout

salutation = "Dear Hiring Manager,\n\n"
cover_letter = "I’m applying for the <title> position at <company>. My expertise is mainly in web development and devops, and I am excited to share my technical expertise with your team. I am also an individual with F-1 status already within the United States, who has recently graduated with a Bachelor’s degree in Software Engineering from Chapman University last May 2019. I have been given work authorization under the OPT program until 2022. This is why I have selected “Yes” for requiring future sponsorship post-OPT.\n\nDuring my previous role at Bloom Technologies, Pte. Ltd. (Google Launchpad ‘17; https://www.bloom.solutions), a financial services company that specializes in cross-border money remittance, I pair-programmed with four other developers to build a mobile-first forex app. This app served as a POS system for money exchangers in Southeast Asia.  I worked on webpage internationalization, which increased our site’s readership by 62%. I also worked on features that introduced ruby libraries like Trailblazer and the dry-rb suite.  We conducted all of our development using TDD techniques, and I enjoy writing tests before features -- it helps me and my coworkers really understand what we’re trying to build and builds confidence in our code when we ship to production.\n\nI assisted our CTO by working on devops related tasks, as the company was migrating from Heroku to Kubernetes on the Google Cloud Platform. One of the major tasks was setting up dockerized blockchain components such as Stellar Horizon and Stellar Core, and keeping these systems up-to-date within Stellar’s distributed network.\n\nI also assisted in building in-house bookkeeping software that tracked Bloom’s OTC trading operations with Bloom’s business clients in South East Asia. This software interfaced with the Bitstamp exchange to provide BTC quotes to both buyers and sellers.\n\nGiven my experience, I have also acquired skills in all phases of software development including requirements engineering, agile development, test-driven development, code review, and software deployment. I would appreciate the opportunity to show you how I can help <company> meet its goals."
closing = "\n\nSincerely,\nXavier Luis J. Ablaza"

def fragment(text, style)
  TextFragment.create(text, style)
end

def draw_text(result, canvas, x, y)
  raise "Error" unless result.remaining_items.empty?
  result.draw(canvas, x, y)
  y - result.height
end

def self.call()
  doc = HexaPDF::Document.new
  canvas = doc.pages.add.canvas
  base_font = doc.fonts.add('Helvetica')
  common_style = {font: base_font, font_size: 11, line_spacing: {:type => :proportional, :value => 1.15}}
  base_style = Style.new(common_style)
  indented_style = Style.new({**common_style, text_indent: 20})
  y = 800
  left = 50
  width = 500
  layouter = TextLayouter.new(base_style)
  indented = TextLayouter.new(indented_style)
  items = [
    [fragment(salutation, base_style)],
    [fragment(cover_letter, base_style)],
    [fragment(closing, base_style)]
  ]
  y = draw_text(layouter.fit(items.first, width, 400), canvas, left, y)
  y = draw_text(indented.fit(items[1], width, 400), canvas, left, y)
  y = draw_text(layouter.fit(items.last, width, 400), canvas, left, y)
  send_data doc.write("116.pdf", optimize: true)
end
