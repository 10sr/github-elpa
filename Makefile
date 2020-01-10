project_root := $(CURDIR)

cask_install_path := $(project_root)/cask-repository

emacs ?= emacs
cask ?= CASK_EMACS=$(emacs) \
	EMACSLOADPATH=$(project_root):$(EMACSLOADPATH) \
	$(cask_install_path)/bin/cask
casked_emacs := $(cask) emacs
git ?= git
markdown ?= markdown

all: compile clean

.PHONY: all

el = $(wildcard *.el)
elc = $(el:%.el=%.elc)

clean:
	$(RM) $(elc)



#####################################
# Testing

.PHONY: test compile info

test: compile info

compile: $(elc)

$(elc): %.elc: %.el
	$(casked_emacs) -batch -q -f batch-byte-compile $<


elisp_get_file_package_info := \
	(lambda (f) \
		(with-temp-buffer \
			(insert-file-contents-literally f) \
			(package-buffer-info)))

elisp_print_infos := \
	(mapc \
		(lambda (f) \
			(message \"Loading info: %s\" f) \
			(message \"%S\" (funcall $(elisp_get_file_package_info) f))) \
		command-line-args-left)

info: $(el)
	$(casked_emacs) -batch -Q \
		--eval "(require 'package)" \
		--eval "$(elisp_print_infos)" \
		$^


elpa:
	$(cask) exec bin/github-elpa update

args ?=
run:
	$(cask) exec bin/github-elpa $(args)

##############################

cask_repository := https://github.com/cask/cask.git
cask_version := v0.8.4

install-cask:
	test -d $(cask_install_path) || $(git) clone $(cask_repository) $(cask_install_path)
	cd $(cask_install_path) && $(git) checkout -f $(cask_version) && $(git) clean -xdf


cask-install:
	$(cask) install
