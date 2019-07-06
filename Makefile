JEKYLL_VERSION = 3.8


all:
	docker run --rm \
		--volume="$$PWD:/srv/jekyll" \
		--volume="$$PWD/vendor/bundle:/usr/local/bundle" \
		-it jekyll/jekyll:$(JEKYLL_VERSION) \
		jekyll build --quiet
.PHONY: all

update:
	npm upgrade --no-save hyperform
	sed -i 's/^hf_version:.*/hf_version: "'"$$(cat node_modules/hyperform/src/version.js|sed -n '$$s/[^0-9.]//g p')"'"/' _config.yml
	sed -i 's/^filesize_plain:.*/filesize_plain: "'"$$(du -k node_modules/hyperform/dist/hyperform.min.js|awk '{print $$1}')"'"/' _config.yml
	sed -i 's/^filesize_gzipped:.*/filesize_gzipped: "'"$$(gzip -c node_modules/hyperform/dist/hyperform.min.js | wc -c | sed 's/\(...\)$$/.\1/' |LANG=C xargs printf %.1f)"'"/' _config.yml
	cp node_modules/hyperform/dist/hyperform.min.js statics/hyperform.min.js
	cp node_modules/hyperform/css/hyperform.css statics/hyperform.css
	cp node_modules/hyperform/test/functional/test.functional.js test/functional/test.functional.js
	cat node_modules/hyperform/test/functional/test.regressions.js | \
		sed 's#../../dist/hyperform.js#../../statics/hyperform.min.js#g' > test/functional/test.regressions.js
	cat node_modules/hyperform/CHANGELOG.md | sed -n '/^## v/,$$p' | sed '1i ---\ntitle: Changelog\n---\n' > CHANGELOG.md
	$(MAKE) all
.PHONY: update

icons: src/icon.16.png
	@echo "* generate icons"
	@for s in 16 32 57 64 70 72 76 114 120 128 144 150 152 180 192 256 310; do \
		echo "  - $${s}px"; \
		rsvg-convert -w $$s -h $$s src/icon.svg > src/icon.$$s.png; \
		optipng -quiet -o7 src/icon.$$s.png; \
	done
.PHONY: icons

src/icon.16.png: src/icon.svg
