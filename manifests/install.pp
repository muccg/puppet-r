#
class r::install {
  package {$r::pkg: ensure => installed }
}
