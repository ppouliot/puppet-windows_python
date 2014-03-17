define windows_python::package::msi (
  $installer,
  $url,
){

  if $installer == undef {
    $installer_path = "${::temp}\\${title}.msi"
    windows_common::remote_file{ $installer_path:
      source      => $url,
      destination => $installer_path,
      before      => Windows_7zip::Extract_file["exe-installer-extract-${name}"],
    }
  } else {
    $installer_path = $installer
  }

  package { $name:
    ensure          => installed,
    source          => $installer_path,
    install_options => ['/PASSIVE', {'ALLUSERS'=>'1'},],
  }
}
