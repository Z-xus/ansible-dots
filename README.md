# ansible-dots

Ansible-based workflow automation to seamlessly set up my environment across different systems. This playbook allows me to quickly clone my dotfiles, install necessary packages, and configure my workflow on the go, ensuring a consistent development environment wherever I am.

## Features

- **Cross-System Compatibility**: Easily adapt the setup to different operating systems.
- **Dotfiles Management**: Automatically clones and sets up my dotfiles using `yadm`.
- **Customizable**: Variables for GitHub username and dotfiles repository allow for flexible configuration.
- **Automated Setup**: Installs essential packages and tools, and configures the environment to my liking.

## Usage

To use this playbook, clone the repository and run it with Ansible:

```bash
ansible-playbook playbook.yml --extra-vars "github_username=YourUsername dotfiles_repo=YourDotfilesRepo"
