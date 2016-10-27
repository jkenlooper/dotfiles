all : .install.sh

.PHONY : all clean

.install.sh : install.sh
	./$<;
	@touch $@;

clean :
	rm $(root-objects) $(user-objects);
