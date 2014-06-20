#
define r::biocupgrade($repo = 'http://bioconductor.org/biocLite.R') {

  include r

  exec { "upgrade_r_bioconductor":
    command   => "${r::params::bin} -e \'source(\"${repo}\"); biocLite(\"BiocUpgrade\")\'",
    logoutput => true,
    timeout   => 600,
  }

}
