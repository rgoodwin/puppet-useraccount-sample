### Puppet User Provisioning Example

Sample code for setting up user accounts via puppet

#### Usage

You should just have to execute to try it out

<code>
vagrant up
</code>

#### module code

Module code is located in <code>provision/modules</code>

*Note: for the main virtual class that holds all users the ssh keys are just UUID's in order to make debugging easier. For real usage replace with actual shell keys*

#### features

Example provides

- user configuration of two hosts (one CentOS one Ubuntu)
- the standard host will get all users provisioned
- the prod_services host will only get some users (others have false shells or just don't exist on the system
- shell keys are provisioned for users along with their accounts
- basic sudo access are setup for some users on each host