include /etc/plexurl.cfg

dummy: build test

build:
	docker build --force-rm -t plexurl .

run:
	docker rm -f plexurl; \
	docker run -d --name plexurl -t plexurl; \
	docker exec -t plexurl plexurl \
		--server $(server) \
		--username $(username) \
		--password $(password) \
		--servername $(servername)

test:
	docker build --force-rm -f Dockerfile.test -t plexurl-test .

run-test:
	docker rm -f plexurl-test;\
	docker run -d --name plexurl-test -t plexurl-test; \
	docker exec -t plexurl-test plexurl \
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

install:
	pip3 install --exists-action w -e .

uninstall:
	pip3 uninstall .
	yes | pip3 uninstall -r requirements.txt

