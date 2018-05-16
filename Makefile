# clear out any suffixes
.SUFFIXES:

objects := .install.sh .global-npm-setup.sh .global-npm-packages.sh .todotxt.sh .timezone.sh .startup.sh

all : $(objects)

.PHONY : all clean

.install.sh : install.sh
	./$<;
	@touch $@;

.todotxt.sh : todotxt.sh .install.sh
	./$<;
	@touch $@;

.global-npm-setup.sh : global-npm-setup.sh .install.sh
	./$<;
	@touch $@;

.global-npm-packages.sh : global-npm-packages.sh .global-npm-setup.sh
	./$<;
	@touch $@;

.startup.sh : .install.sh
	echo "Logout and back in and cd to dotfiles/ and run startup.sh";
	@touch $@;

.timezone.sh : timezone.sh
	./$<;
	@touch $@;

clean :
	rm $(objects);


