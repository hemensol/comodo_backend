require 'rails_helper'

RSpec.describe Shoe, type: :model do

  it {is_expected.to(validate_presence_of(:name))}
  it {is_expected.to(have_many(:shoe_items))}
  
end
