SHELL:=/bin/bash

DOC_DIR?=/usr/share/doc
SHARE_DIR?=/usr/share
DEST_DIR?=

FILES := $(shell find django_biblatex/* -type f ! -path "**/__pycache__")


ifdef VERBOSE
  Q :=
else
  Q := @
endif

print-%:
	@echo $*=$($*)


clean:
	$(Q)rm -rf ./build
	$(Q)rm -rf ./dist
	$(Q)rm -rf ./django-biblatex.egg-info
	$(Q)find django_biblatex -depth -name __pycache__ -exec rm -rf {} \;


changelog.latest.md:
	$(Q)( \
		echo -e "Changes" > changelog.latest.md; \
		declare TAGS=(`git tag`); \
		for ((i=$${#TAGS[@]};i>=0;i--)); do \
			if [ $$i -eq 0 ]; then \
				echo -e "$${TAGS[$$i]}" >> changelog.latest.md; \
				git log $${TAGS[$$i]} --no-merges --format="  * %h %s"  >> changelog.latest.md; \
			elif [ $$i -eq $${#TAGS[@]} ] && [ $$(git log $${TAGS[$$i-1]}..HEAD --oneline | wc -l) -ne 0 ]; then \
				git log $${TAGS[$$i-1]}..HEAD --no-merges --format="  * %h %s"  >> changelog.latest.md; \
			elif [ $$i -lt $${#TAGS[@]} ]; then \
				git log $${TAGS[$$i-1]}..$${TAGS[$$i]} --no-merges --format="  * %h %s"  >> changelog.latest.md; \
				break; \
			fi; \
		done \
	)
