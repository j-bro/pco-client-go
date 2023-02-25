SERVICES_SPEC_FILE=https://raw.githubusercontent.com/j-bro/pco-openapi-spec/main/services.openapi.yaml

.PHONY: codegen
codegen:
	docker build -t pco-openapi-spec/oapi-codegen .
	docker run --rm -v "${PWD}:/mnt" \
	pco-openapi-spec/oapi-codegen \
	oapi-codegen \
	-generate types,client \
	-package client \
	${SERVICES_SPEC_FILE} > client.go
