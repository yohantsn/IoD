.DEFAULT_GOAL    := help

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
base="master"

coverage:
	@flutter test --coverage
	@genhtml coverage/lcov.info -o coverage/html
	@open coverage/html/index.html