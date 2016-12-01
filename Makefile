emacs ?= emacs
all: test

test:
	$(emacs) -Q -batch -l sdlang-mode-test.el -l sdlang-mode.el -f ert-run-tests-batch-and-exit

compile:
	$(emacs) -Q -batch -f batch-byte-compile sdlang-mode.el

clean:
	rm -f sdlang-mode.elc

.PHONY:	all test compile clean
