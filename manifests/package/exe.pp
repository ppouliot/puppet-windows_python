define windows_python::package::exe (
  $url        = undef,
  $installer  = undef,
  $version,
){

  Exec { provider => powershell, }

  if $installer == undef {
    $installer_path = "${::temp}\\${title}.exe"
    windows_common::remote_file{ $installer_path:
      source      => $url,
      destination => $installer_path,
      before      => Windows_7zip::Extract_file["exe-installer-extract-${name}"],
    }
  } else {
    $installer_path = $installer
  }

  windows_7zip::extract_file{"exe-installer-extract-${name}":
    file        => $installer_path,
    destination => $::temp,
  }

  exec { "trigger-python-dependency-${name}":
    command  => "Write-Output \"Installing python dependency: ${name}",
    unless   => "\$output = pip freeze; exit !(\$output.ToLower().Contains(\"${name}==${version}\".ToLower()))",
    notify   => Windows_7zip::Extract_file["exe-installer-extract-${name}"],
  }

  exec { "move-platlib-${name}":
    command     => "Copy-Item -Path ${::temp}\\PLATLIB\\* -Destination C:\\python27\\Lib\\site-packages\\ -Force -Recurse; Remove-Item -Path ${::temp}\\PLATLIB -Force -Recurse",
    unless      => "exit (Test-Path -Path '${::temp}\\PLATLIB')",
    refreshonly => true,
    subscribe   => Windows_7zip::Extract_file["exe-installer-extract-${name}"],
  }

  exec { "move-scripts-${name}":
    command     => "Copy-Item -Path ${::temp}\\SCRIPTS\\* -Destination C:\\python27\\Scripts\\ -Force -Recurse; Remove-Item -Path ${::temp}\\SCRIPTS -Force -Recurse",
    unless      => "exit (Test-Path -Path '${::temp}\\SCRIPTS')",
    refreshonly => true,
    subscribe   => Windows_7zip::Extract_file["exe-installer-extract-${name}"],
  }

  exec { "move-headers-${name}":
    command     => "Copy-Item -Path ${::temp}\\HEADERS\\* -Destination C:\\python27\\ -Force -Recurse; Remove-Item -Path ${::temp}\\HEADERS -Force -Recurse",
    unless      => "exit (Test-Path -Path '${::temp}\\HEADERS')",
    refreshonly => true,
    subscribe   => Windows_7zip::Extract_file["exe-installer-extract-${name}"],
  } 
}
