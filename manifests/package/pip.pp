define windows_python::package::pip (
  $proxy      = undef,
  $source     = undef,
  $version    = latest,
){
  package { $name:
    source   => $source,
    ensure   => $version,
    provider => pip,
  }
}
