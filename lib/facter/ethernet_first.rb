# Returns first ethernet adapter by name for syslinux based systems
Facter.add(:ethernet_first) do
  confine :operatingsystem => 'Archlinux'
  setcode do
   interfaces = Facter.value(:interfaces)
   interfaces.split(',').select{ |i| i =~ /^en/ }.sort.first
  end
end
