#
class r::install {
  package {$r::pkg: ensure => $r::ensure }
}
