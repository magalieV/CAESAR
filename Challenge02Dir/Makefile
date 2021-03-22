##
# File name : Makefile
# Abstract : Makefile of challenge02
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 04/01/2021
# Last modification : 04/01/2021
##

#### -------------- Global variables -------------- ####
RM				=	rm -rf

COPY			=	cp

CH				= chmod 755

ECHO			= echo

MAKEFLAGS	+=	--no-print-directory

#### -------------- Challenge 02 info -------------- ####
CHALLENGE02NAME	=	../challenge02
CHALLENGE02FILE	=	source02.py
CHALLENGE02SENT	=	"Copy source02.py to challenge02"
CHALLENGE02LAW	=	"Give execution right to challenge02"
CHALLENGE02DEL	=	"Delete challenge02"

#### -------------- CHALLENGE02 rules -------------- ####

all:
		@$(ECHO) "     [START challenge 02]"
		@$(COPY) $(CHALLENGE02FILE) $(CHALLENGE02NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE02SENT) ||	\
		$(ECHO) "[KO]" $(CHALLENGE02SENT)
		@$(CH) $(CHALLENGE02NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE02LAW) ||	\
		$(ECHO) "[KO]" $(CHALLENGE02LAW)
		@$(ECHO) "     [END challenge 02]"

clean:
		@$(RM) $(CHALLENGE02NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE02DEL) ||	\
		$(ECHO) "[KO]" $(CHALLENGE02DEL)

tests:
		@./test_challenge02.sh

fclean: clean

re_silent:
	@$(RM) $(CHALLENGE02NAME)
	@$(COPY) $(CHALLENGE02FILE) $(CHALLENGE02NAME)
	@$(CH) $(CHALLENGE02NAME)

re: fclean all

.PHONY:	all clean tests fclean re