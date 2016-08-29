require 'spec_helper'
describe 'archlinux' do

let(:params) do
  { 
    :default_user => 'IAMAUSER',
    :hostname     => 'IAMAHOSTNAME',
    :timezone     => 'COUNTRY/CITY',
  }
end

context 'when using Arch Linux' do

  let(:facts) do
    { 
      :osfamily        => 'Archlinux',
      :operatingsystem => 'Archlinux',
      :productname     => '',
      :virtual         => '',
      :interfaces      => 'EN',
      :ethernet_first  => "EN0",
      :apple_hardware  => ''
    }
  end

  context 'with default values for all parameters' do
    it { should contain_class('archlinux') }

    it { should contain_class('archlinux::console') }
    it { should contain_class('archlinux::dhcp') }
    it { should contain_class('archlinux::harddrive') }
    it { should contain_class('archlinux::keyboard') }
    it { should contain_class('archlinux::ethernet') }
    it { should contain_class('archlinux::networking') }
    it { should contain_class('archlinux::power_saving') }
    it { should contain_class('archlinux::ssh') }
    it { should contain_class('archlinux::suspend') }
    it { should contain_class('archlinux::swap') }
    it { should contain_class('archlinux::wireless') }

    it { is_expected.to contain_class('archlinux::hostname').with(
      'hostname' => 'IAMAHOSTNAME' ) }

    it { is_expected.to contain_class('archlinux::localusers').with(
      'auto_login'    => true,
      'default_user'  => 'IAMAUSER',
      'default_shell' => '/usr/bin/zsh' ) }

    it { is_expected.to contain_class('archlinux::system').with(
      'hostname' => 'IAMAHOSTNAME' ) }
  end

  context 'when apple_hardware => true' do
    let(:facts) do
      { 
        :osfamily        => 'Archlinux',
        :virtual         => 'parallels',
        :productname     => '',
        :interfaces      => 'EN',
        :ethernet_first  => "EN0",
        :apple_hardware  => ''
      }
    end

    it { should contain_class('archlinux::macbook') }
  end

  context 'when virtual => parallels' do
    let(:facts) do
      { 
        :osfamily        => 'Archlinux',
        :virtual         => 'parallels',
        :productname     => '',
        :interfaces      => 'EN',
        :ethernet_first  => "EN0",
        :apple_hardware  => ''
      }
    end

    it { should contain_class('archlinux::parallels') }
  end

  context 'when virtual => virtualbox' do
    let(:facts) do
      { 
        :osfamily        => 'Archlinux',
        :virtual         => 'virtualbox',
        :productname     => '',
        :interfaces      => 'EN',
        :ethernet_first  => "EN0",
        :apple_hardware  => ''
      }
    end

    it { should contain_class('archlinux::virtualbox') }
  end

  context 'when not Arch Linux' do
    let(:facts) do
      { 
        :osfamily        => 'NOT_ARCH',
        :operatingsystem => 'NOT_ARCH',
      }
    end

    it { should compile.and_raise_error(/not a supported operating system/) }
  end
end
end
