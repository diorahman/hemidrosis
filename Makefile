MONGOSKIN_REPLICASET = false
NODE_BIN=./node_modules/.bin
MOCHA=$(NODE_BIN)/mocha
COVERALLS=$(NODE_BIN)/coveralls

# slow disk reading, slow disk reading, slow disk reading!!!
test:
	@$(MOCHA) -R spec --timeout 1000

test-replicaset:
	@MONGOSKIN_REPLICASET=true $(MOCHA)

test-cov: 
	@$(MOCHA) -R html-cov > coverage.html

coveralls:
	@$(MOCHA) -R mocha-lcov-reporter | $(COVERALLS)

test-watch:
	@$(MOCHA) -w -R dot --growl

.PHONY: test-cov test-replicaset test
