# TODO: I'd really like to divide some of these into modules...
# Can have a modules folder that can be stowed safely by making it nested three levels in...


# This should really be in its own file, and should be loaded first...
# Should also fall back to using uname, or other detection means...
# Via: https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#         # ...
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#         # Mac OSX
# elif [[ "$OSTYPE" == "cygwin" ]]; then
#         # POSIX compatibility layer and Linux environment emulation for Windows
# elif [[ "$OSTYPE" == "msys" ]]; then
#         # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
# elif [[ "$OSTYPE" == "win32" ]]; then
#         # I'm not sure this can happen.
# elif [[ "$OSTYPE" == "freebsd"* ]]; then
#         # ...
# else
#         # Unknown.
		  # uname or whatever...
# fi



# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,bash_completion,extra,osx}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# Global stuff
export PATH="$HOME/bin:/usr/local/bin:$PATH";

unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# More on GPG/SSH pinentry config
# https://juliansimioni.com/blog/troubleshooting-gpg-git-commit-signing/
# https://wiki.gentoo.org/wiki/GnuPG#Changing_pinentry_for_SSH_logins

# Maybe I should also check for if DISPLAY is set??
# https://superuser.com/questions/1457167/i-want-to-make-pinentry-use-gui-locally-and-cli-on-ssh

if [[ -n "$SSH_CONNECTION" ]]; then
	export PINENTRY_USER_DATA="USE_CURSES=1"
fi

