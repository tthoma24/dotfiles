# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022k is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

source /etc/profile
source ~/src/kdo/kdo.sh

if [ "$(uname)" = 'Darwin' ]; then
        export BASH_SILENCE_DEPRECATION_WARNING=1
fi

export DOTNET_CLI_TELEMETRY_OPTOUT=true

export PATH=/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:/opt/local/Library/Frameworks/Python.framework/Versions/3.8/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
#export PYTHONPATH="$(find /opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/ -maxdepth 1 -type d | sed '/\/\./d' | tr '\n' ':' | sed 's/:$//')"
export LESSOPEN='| /opt/local/bin/lesspipe.sh %s'

if [ -d "$HOME/src/adb-fastboot/platform-tools" ] ; then
     export PATH="$HOME/src/adb-fastboot/platform-tools:$PATH"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
    if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
          . /opt/local/etc/profile.d/bash_completion.sh
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# What the cow say?
cowsay `fortune -as`

# AWS Okta Login function
aws()
{
    if [ $# -gt 0 ] && [ "$1" == "login" ]; then
	tput bel
	echo "🛑 REMEMBER TO SET -n OR --name SO YOU DON'T OVERWRITE THE DEFAULT CREDENTIALS!!! 🛑"
	shift
	command aws_okta_keyman "$@"
    else
	command aws "$@"
    fi
}
