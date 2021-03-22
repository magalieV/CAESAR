##
# File name : Makefile
# Abstract : Makefile of challenge04
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 05/01/2021
# Last modification : 06/01/2021
##

#### -------------- Global variables -------------- ####
RM				=	rm -rf

COPY			=	cp

CH				= chmod 755

ECHO			= echo

MAKEFLAGS	+=	--no-print-directory

#### -------------- Challenge 04 info -------------- ####
CHALLENGE04NAME	=	../challenge04
CHALLENGE04FILE	=	source04.py
CHALLENGE04SENT	=	"Copy source04.py to challenge04"
CHALLENGE04LAW	=	"Give execution right to challenge04"
CHALLENGE04DEL	=	"Delete challenge04"

#### -------------- CHALLENGE04 rules -------------- ####

all:
		@$(ECHO) "     [START challenge 04]"
		@$(COPY) $(CHALLENGE04FILE) $(CHALLENGE04NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE04SENT) ||	\
		$(ECHO) "[KO]" $(CHALLENGE04SENT)
		@$(CH) $(CHALLENGE04NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE04LAW) ||	\
		$(ECHO) "[KO]" $(CHALLENGE04LAW)
		@$(ECHO) "     [END challenge 04]"

clean:
		@$(RM) $(CHALLENGE04NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE04DEL) ||	\
		$(ECHO) "[KO]" $(CHALLENGE04DEL)

tests:
		@./test_challenge04.sh

fclean: clean

re_silent:
	@$(RM) $(CHALLENGE04NAME)
	@$(COPY) $(CHALLENGE04FILE) $(CHALLENGE04NAME)
	@$(CH) $(CHALLENGE04NAME)

re: fclean all

.PHONY:	all clean tests fclean re