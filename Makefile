IMAGE=tomdesinto/gruyere
CONTAINER=gruyere
PORTS=-p 8008:8008

build:
	docker build --rm --tag "$(IMAGE)" .

clean:
	docker rm -f $(CONTAINER) |:
	
run: clean
	docker run -d $(PORTS) --name $(CONTAINER) "$(IMAGE)"
	
logs:
	docker logs -f $(CONTAINER)

shell:
	docker run --rm --tty --interactive $(PORTS) "$(IMAGE)" bash -il