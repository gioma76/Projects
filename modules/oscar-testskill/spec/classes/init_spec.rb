require 'spec_helper'
describe 'testskill' do

  context 'with defaults for all parameters' do
    it { should contain_class('testskill') }
  end
end
