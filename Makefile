objects := .install.sh .neowvim.sh

all : $(objects)

.PHONY : all clean

.install.sh : install.sh
	./$<;
	@touch $@;

.neovim.sh : neovim.sh .install.sh
	./$<;
	@touch $@;

clean :
	rm $(objects);
