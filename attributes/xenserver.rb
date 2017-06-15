if platform?('xenserver')
  default['yum-centos']['repos'].each do |repo|
    default['yum'][repo].each do |key, value|
      if value.is_a?(String)
        default['yum'][repo][key] =
          value.gsub('$releasever', node['platform_version'].to_i.to_s)
      end
    end

    default['yum'][repo]['mirrorlist'] = nil
    default['yum'][repo]['exclude'] = 'kernel kernel-abi-whitelists kernel-debug kernel-debug-devel kernel-devel kernel-doc kernel-tools kernel-tools-libs kernel-tools-libs-devel linux-firmware biosdevname centos-release systemd* stunnel kexec-tools ocaml*'
  end
end
