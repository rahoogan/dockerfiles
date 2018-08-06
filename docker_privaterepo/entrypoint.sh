# Setup Git Config
echo "Setting Git Config Values"
git config --global user.email "$GIT_EMAIL" && \
    git config --global user.name "$GIT_USERNAME"

# Setup Git Folders
echo "Adding Host Key for Github"
cd /home/$USER_ID/ \
	&& ssh-keyscan github.com > /home/$USER_ID/.ssh/known_hosts

# Add ssh-key to SSH Agent
echo "Adding SSH Key to ssh-agent" \
	&& eval `ssh-agent -s` && ssh-add /home/$USER_ID/.ssh/id_rsa 

# Cloning from remote repository
git clone $GIT_URL

# Prevent container from exiting
tail -f /dev/null
