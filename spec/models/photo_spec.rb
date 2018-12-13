require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "Photo attibutes" do
    it { should have_attached_file(:images) }
    it { should validate_attachment_presence(:images) }
    it { should validate_attachment_content_type(:photos).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
  end
end