require 'spec_helper'

describe 'archlinux::macbook' do
context 'when running Arch Linux on a macbook' do
  let(:facts) do
    { 
      :osfamily        => 'Archlinux',
      :operatingsystem => 'Archlinux',
      :productname     => '',
      :virtual         => '',
      :interfaces      => 'EN',
      :ethernet_first  => "EN0",
      :apple_hardware  => true
    }
  end

  let(:params) do
    { 
      :bluetooth => true,
      :webcam    => true,
    }
  end

  it { should contain_class('archlinux::macbook::audio') }
  it { should contain_class('archlinux::macbook::backlight') }
  it { should contain_class('archlinux::macbook::cardreader') }
  it { should contain_class('archlinux::macbook::sensors') }
  it { should contain_class('archlinux::macbook::i915') }
  it { should contain_class('archlinux::macbook::keyboard') }
  it { should contain_class('archlinux::macbook::touchpad') }
  it { should contain_class('archlinux::macbook::wireless') }

  it { is_expected.to contain_class('archlinux::macbook::bluetooth').with(
    'bluetooth' => true ) }

  it { is_expected.to contain_class('archlinux::macbook::webcam').with(
    'webcam' => true ) }
end
end
