#
# class determines which user groups are put on which hosts
#
class users {

  case $hostname {
    /^prodservices/: {
      include users::groups::prod_services
    }
    default: {
      include users::groups::standard_hosts
    }
  }

	
}


