require 'spec_helper'

describe Query do
  it { should belong_to(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:q_string) }
  
end