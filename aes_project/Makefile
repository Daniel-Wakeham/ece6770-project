########################################
# Makefile
########################################

all: syn_all pnr_all

syn_all:
	cd synthesis && $(MAKE)

pnr_all:
	cd pnr && $(MAKE)

clean_all: clean_syn clean_pnr

clean_syn:
	cd synthesis && $(MAKE) clean

clean_pnr:
	cd pnr && $(MAKE) clean