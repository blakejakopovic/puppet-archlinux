# Returns true if apple hardware present
Facter.add(:apple_hardware) do
  setcode do
   sda_model = Facter.value(:blockdevice_sda_model)
   sda_model =~ /APPLE/
  end
end
