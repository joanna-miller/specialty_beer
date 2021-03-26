require 'rails_helper'

describe User do
  context '(validations)' do
    it { should validate_presence_of :birth_date }
  end
end