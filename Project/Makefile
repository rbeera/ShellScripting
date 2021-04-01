help:  ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

common: ## run this command for all validations
	@sh - x Components/common.sh

catalogue:	common ## Install Catalogue component for roboshop project
	@sh Components/catalogue.sh

cart:		common ## Install cart component for roboshop project
	@sh Components/cart.sh

frontend:	common ## Install frontend component for roboshop project
	@sh Components/frontend.sh

mongodb:	common ## Install mongodb component for roboshop project
	@sh Components/mongodb.sh

redis:	common ## Install redis component for roboshop project
	@sh Components/redis.sh

user:	common ## Install user component for roboshop project
	@sh Components/user.sh

mysql:	common ## Install mysql component for roboshop project
	@sh Components/mysql.sh