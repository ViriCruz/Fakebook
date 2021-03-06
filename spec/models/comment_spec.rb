# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) do
    FactoryBot.create(:random_comment)
  end

  it '# creates a valid comment' do
    expect(comment).to be_valid
  end

  it '# creates an invalid comment with no text ' do
    comment.text = nil
    expect(comment).to_not be_valid
  end

  it '# creates an invalid blank comment' do
    comment.text = ''
    expect(comment).to_not be_valid
  end

  it '# creates an invalid comment with text longer than 300 characters ' do
    comment.text = Faker::Lorem.paragraph_by_chars(number: 301, supplemental: false)
    expect(comment).to_not be_valid
  end

  it '# creates an invalid postless comment' do
    comment.post = nil
    expect(comment).to_not be_valid
  end

  it '# creates an invalid userless comment ' do
    comment.user = nil
    expect(comment).to_not be_valid
  end
end
