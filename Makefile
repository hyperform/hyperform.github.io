all:
	jekyll build --quiet

icons: src/icon.16.png
	@echo "* generate icons"
	@for s in 16 32 57 64 70 72 76 114 120 128 144 150 152 180 192 256 310; do \
		echo "  - $${s}px"; \
		rsvg-convert -w $$s -h $$s src/icon.svg > src/icon.$$s.png; \
		optipng -quiet -o7 src/icon.$$s.png; \
	done
.PHONY: icons

src/icon.16.png: src/icon.svg
