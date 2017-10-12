require 'spec_helper'
describe 'joomla' do
  context 'with default values for all parameters' do
    it { should contain_class('joomla') }
  end
end
