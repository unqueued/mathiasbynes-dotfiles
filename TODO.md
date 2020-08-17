# TODO

Todos for this dotfiles repo...

- [ ] Set up a dotfiles-ring0
- [ ] Figure out what to do about ~/bin
	Does not have to be complicated. Don't have to invent a whole package manager. Can just have a stow package for "bins-cache" or whatever.
- [x] Do something to replace .extras probably for conditional config values.
	Keeping git overrides in ~/.extras does not make sense since it just writes to .gitconfig, which I want to be general.
		Solved, made ~/.gitconfig-user and included it. Need to migrate to dotfiles-ring0

- [ ] Git templates?

- [ ] Improve prompt. current one is way slow...
	At least have a timeout for git status
