# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

ANDROID_HOME=$HOME/android-sdk-linux
PATH=$HOME/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:$PATH

export ANDROID_HOME
export PATH
