FROM hashicorp/tfc-agent:latest

USER root

# Copy files over
COPY scripts/install_azure_cli.sh

# Install sudo. The container runs as a non-root user, but people may rely on
# the ability to apt-get install things.
RUN apt-get -y install sudo

# Install Azure CLI
RUN install_azure_cli.sh

# Permit tfc-agent to use sudo apt-get commands.
RUN echo 'tfc-agent ALL=NOPASSWD: /usr/bin/apt-get , /usr/bin/apt' >> /etc/sudoers.d/50-tfc-agent

USER tfc-agent


