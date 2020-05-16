# Request POSIX compatibility and clear suffixes,
# thereby clearing all default inference rules.
.POSIX:
.SUFFIXES:

all: Greece

Greece: Greece.pdf
Greece.pdf: Greece.sh
	./Greece.sh
