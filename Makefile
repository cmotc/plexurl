include /etc/plexurl.cfg

dummy:

build:
	docker build -t plexurl .

run:
	docker rm -f plexurl;\
	docker run --name plexurl -t plexurl plexurl \
		--server $(server) \
		--username $(username) \
		--password $(password) \
		--servername $(servername)

test:
	docker build -f Dockerfile.test -t plexurl-test .

run-test:
	docker rm -f plexurl-test;\
	docker run --name plexurl-test -t plexurl-test plexurl \
		--server $(server) \
		--username $(username) \
		--password $(password) \
		--servername $(servername)

docker:
	docker build -t plexurl .

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
