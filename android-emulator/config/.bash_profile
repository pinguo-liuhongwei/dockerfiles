# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

ANDROID_HOME=$HOME/android-sdk-linux
PATH=$PATH:$HOME/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

export ANDROID_HOME
export PATH
