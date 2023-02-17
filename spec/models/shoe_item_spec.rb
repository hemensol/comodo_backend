require 'rails_helper'

RSpec.describe ShoeItem, type: :model do

  it {is_expected.to(validate_presence_of(:size))}
  it {is_expected.to(validate_presence_of(:amount))}

  it {is_expected.to(belong_to(:shoe))}

end
