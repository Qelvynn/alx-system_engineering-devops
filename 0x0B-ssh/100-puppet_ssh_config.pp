# This Puppet code configures the SSH client to use a custom private key.
# It ensures seamless server connections without requiring password authentication.

include stdlib

file_line { 'SSH Private Key':
  path               => '/etc/ssh/ssh_config',
  line               => '    IdentityFile ~/.ssh/school',
  match              => '^[#]+[\s]*(?i)IdentityFile[\s]+~/.ssh/id_rsa$',
  replace            => true,
  append_on_no_match => true
}

# Explanation of the regex used for matching:
# ^[#]+[\s]* - Matches the start of a commented line with optional whitespace.
# (?i)IdentityFile - 'IdentityFile' keyword, case-insensitive.
# [\s]+~/.ssh/id_rsa - One or more spaces followed by the default private key path.
# $ - End of the line.

file_line { 'Deny Password Auth':
  path               => '/etc/ssh/ssh_config',
  line               => '    PasswordAuthentication no',
  match              => '^[#]+[\s]*(?i)PasswordAuthentication[\s]+(yes|no)$',
  replace            => true,
  append_on_no_match => true
}

# Explanation of the regex used for matching:
# ^[#]+[\s]* - Matches the start of a commented line with optional whitespace.
# (?i)PasswordAuthentication - 'PasswordAuthentication' keyword, case-insensitive.
# [\s]+(yes|no) - One or more spaces followed by either 'yes' or 'no'.
# $ - End of the line.
