include vars.mk
include contrib/makefiles/pkg/base/base.mk
include contrib/makefiles/pkg/string/string.mk
include contrib/makefiles/pkg/color/color.mk
include contrib/makefiles/pkg/functions/functions.mk
include contrib/makefiles/target/git/git.mk
include contrib/makefiles/target/buildenv/buildenv.mk
include contrib/makefiles/target/go/go.mk
include contrib/makefiles/target/anubis-vault/files.mk
include contrib/makefiles/target/anubis-vault/encrypt.mk
include contrib/makefiles/target/anubis-vault/decrypt.mk
THIS_FILE := $(firstword $(MAKEFILE_LIST))
SELF_DIR := $(dir $(THIS_FILE))

.SILENT: build
.PHONY: build
build:
	- $(call print_running_target)
	- @$(MAKE) --no-print-directory -f $(THIS_FILE) go-build
	- $(call print_completed_target)
.SILENT: clean
.PHONY: clean
clean:
	- $(call print_running_target)
	- @$(MAKE) --no-print-directory -f $(THIS_FILE) go-clean
	- $(call print_completed_target)

.PHONY: anubis-vault
.SILENT:anubis-vault
anubis-vault: demo-files
	- $(call print_running_target)
	- @$(MAKE) --no-print-directory -f $(THIS_FILE) anubis-vault-single-decrypt
	- @$(MAKE) --no-print-directory -f $(THIS_FILE) anubis-vault-multi-encrypt
	- $(call print_completed_target)


