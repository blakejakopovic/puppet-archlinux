require 'spec_helper'

describe 'archlinux::virtualbox' do
context 'when running Arch Linux in virtualbox' do
  let(:facts) do
    { 
      :osfamily        => 'Archlinux',
      :operatingsystem => 'Archlinux',
      :productname     => '',
      :virtual         => 'virtualbox',
      :interfaces      => 'EN',
      :ethernet_first  => "EN0"
    }
  end

  it { should contain_class('archlinux::virtualbox::ethernet') }
  it { should contain_class('archlinux::virtualbox::guest') }
  it { should contain_class('archlinux::virtualbox::video') }
end
end
