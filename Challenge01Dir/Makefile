##
# File name : Makefile
# Abstract : Makefile of challenge01
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

#### -------------- Challenge 01 info -------------- ####
CHALLENGE01NAME	=	../challenge01
CHALLENGE01FILE	=	source01.py
CHALLENGE01SENT	=	"Copy source01.py to challenge01"
CHALLENGE01LAW	=	"Give execution right to challenge01"
CHALLENGE01DEL	=	"Delete challenge01"

#### -------------- CHALLENGE01 rules -------------- ####

all:
		@$(ECHO) "     [START challenge 01]"
		@$(COPY) $(CHALLENGE01FILE) $(CHALLENGE01NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE01SENT) ||	\
		$(ECHO) "[KO]" $(CHALLENGE01SENT)
		@$(CH) $(CHALLENGE01NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE01LAW) ||	\
		$(ECHO) "[KO]" $(CHALLENGE01LAW)
		@$(ECHO) "     [END challenge 01]"

clean:
		@$(RM) $(CHALLENGE01NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE01DEL) ||	\
		$(ECHO) "[KO]" $(CHALLENGE01DEL)

tests:
		@./test_challenge01.sh

fclean: clean

re_silent:
	@$(RM) $(CHALLENGE01NAME)
	@$(COPY) $(CHALLENGE01FILE) $(CHALLENGE01NAME)
	@$(CH) $(CHALLENGE01NAME)

re: fclean all

.PHONY:	all clean tests fclean re