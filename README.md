# ansible-dots

Ansible-based workflow automation for seamlessly setting up a consistent development environment across different systems. This playbook allows quick cloning of dotfiles, installation of necessary packages, and configuration of workflow on the go.

## Features

- **Cross-System Compatibility**: Easily adapt the setup to different operating systems.
- **Dotfiles Management**: Automatically clones and sets up dotfiles using `yadm`.
- **SSH Key Management**: Securely stores and deploys SSH keys using Ansible Vault.
- **Customizable**: Variables for GitHub username and dotfiles repository allow for flexible configuration.
- **Automated Setup**: Installs essential packages and tools, and configures the environment to your liking.

## Prerequisites

- Ansible (version 2.9 or later)
- Git
- Basic understanding of YAML and Ansible playbooks

## Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/YourUsername/ansible-dots.git
   cd ansible-dots
   ```

2. Create an `ssh_keys.yml` file with your SSH keys:
   ```yaml
   ssh_private_key: |
     -----BEGIN OPENSSH PRIVATE KEY-----
     Your private key here
     -----END OPENSSH PRIVATE KEY-----
   ssh_public_key: |
     ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJHmZ... your public key here
   ```

3. Encrypt the SSH keys file:
   ```bash
   ansible-vault encrypt ssh_keys.yml
   ```
   You'll be prompted to create a password for the vault.

## Usage

Run the playbook with:

```bash
ansible-playbook playbook.yml --ask-vault-pass --ask-become-pass --extra-vars "github_username=YourUsername dotfiles_repo=YourDotfilesRepo"
```

Replace `YourUsername` and `YourDotfilesRepo` with your GitHub username and dotfiles repository name.

## Customization

- Modify `playbook.yml` to add or remove tasks as needed.
- Adjust variables in `playbook.yml` or create a separate `vars.yml` file for more complex setups.
- Add or modify tasks in the `tasks/` directory to tailor the setup to your needs.

## Verification

After running the playbook, verify the setup:

1. Check SSH key installation:
   ```bash
   ls -l ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
   ```

2. Test SSH functionality:
   ```bash
   ssh -T git@github.com
   ```

3. Verify installed packages and configurations as needed.

## Troubleshooting

- If SSH key deployment fails, ensure the `ssh_keys.yml` file is correctly formatted and encrypted.
- For permission issues, check that the playbook is run with appropriate privileges (using `--ask-become-pass`).
- Review Ansible output for specific task failures and adjust accordingly.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
