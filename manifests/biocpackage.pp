#
define r::biocpackage($repo = 'http://bioconductor.org/biocLite.R') {

  include r

  exec { "install_r_bioconductor_package_${name}":
    command   => "${r::params::bin} -e \'source(\"${repo}\"); biocLite(\"${name}\")\'",
    unless    => "${r::params::bin} -q -e '\"${name}\" %in% installed.packages()' | grep 'TRUE'",
    logoutput => true,
    timeout   => 600,
  }

}
