# == Class: windows_python::package::pip
define windows_python::package::pip (
  $proxy      = undef,
  $source     = undef,
  $version    = latest,
){
  package { $name:
    ensure   => $version,
    source   => $source,
    provider => pip,
  }
}
