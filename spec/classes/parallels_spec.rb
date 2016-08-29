require 'spec_helper'

describe 'archlinux::parallels' do
context 'when running Arch Linux in parallels' do
  let(:facts) do
    { 
      :osfamily        => 'Archlinux',
      :operatingsystem => 'Archlinux',
      :productname     => '',
      :virtual         => 'parallels',
      :interfaces      => 'EN',
      :ethernet_first  => "EN0"
    }
  end

  it { should contain_class('archlinux::parallels::ethernet') }
  it { should contain_class('archlinux::parallels::video') }
end
end
