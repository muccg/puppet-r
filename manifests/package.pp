# derived from https://github.com/forward3d/puppet-r.git
define r::package($repo = 'http://cran.rstudio.com', $dependencies = false) {

  include r
  include r::params

  case $dependencies {
    true: { $dependencies_command = "${r::params::bin} -e \"install.packages('${name}', repos='${repo}', dependencies = TRUE)\"" }
    default: { $dependencies_command = "${r::params::bin} -e \"install.packages('${name}', repos='${repo}', dependencies = FALSE)\"" }
  }

  exec { "install_r_package_${name}":
    command   => $dependencies_command,
    unless    => "${r::params::bin} -q -e '\"${name}\" %in% installed.packages()' | grep 'TRUE'",
    logoutput => true,
    require   => Class['R']
  }

}
