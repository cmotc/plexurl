
dummy:

pkg:
	rm -r debian
	dh_make --python \
		--createorig \
		--copyright gpl3 \
		--email problemsolver@openmailbox.org \
		--packagename plexurl_0.1 \
		--yes

deb:
	debuild -us -uc
