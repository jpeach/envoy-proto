.PHONY: regenerate
regenerate:
	@for g in */generate.sh; do \
		echo running $$g; \
		$$g; \
	done

.PHONY: check
check: test

.PHONY: test
test:
	@for p in */proto ; do \
		echo checking $$p; \
		(cd $$p && buf build ); \
	done

