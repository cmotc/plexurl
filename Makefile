
dummy:

deb:
	rm -rf debian
	dh_make --python \
		--createorig \
		--copyright gpl3 \
		--email problemsolver@openmailbox.org \
		--packagename plexurl_0.1 \
		--yes
	debuild -us -uc
