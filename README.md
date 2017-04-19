# docker-ansible
To run Ansible into docker

# example
Put lines like the following into your .bash_profile file:

export TAG='dev'

alias ansible-playbook='docker run --rm -it -v $(pwd):/etc/ansible -v $HOME/.ssh:/root/.ssh -v $HOME/.aws/:/root/.aws -v /var/run/docker.sock:/var/run/docker.sock --entrypoint=ansible-playbook scakkia/ansible:$TAG'
