help:  ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

catalogue: ## Install Catalogue component for roboshop project
	@sh Components/catalogue.sh

cart: ## Install cart component for roboshop project
	@sh Components/cart.sh