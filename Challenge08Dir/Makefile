##
# File name : Makefile
# Abstract : Makefile of challenge08
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 14/01/2021
# Last modification : 14/01/2021
##

#### -------------- Global variables -------------- ####
RM				=	rm -rf

COPY			=	cp

CH				= chmod 755

ECHO			= echo

MAKEFLAGS	+=	--no-print-directory

#### -------------- Challenge 08 info -------------- ####
CHALLENGE08NAME	=	../challenge08
CHALLENGE08FILE	=	source08.py
CHALLENGE08SENT	=	"Copy source08.py to challenge08"
CHALLENGE08LAW	=	"Give execution right to challenge08"
CHALLENGE08DEL	=	"Delete challenge08"

#### -------------- CHALLENGE03 rules -------------- ####

all:
		@$(ECHO) "     [START challenge 08]"
		@$(COPY) $(CHALLENGE08FILE) $(CHALLENGE08NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE08SENT) ||	\
		$(ECHO) "[KO]" $(CHALLENGE08SENT)
		@$(CH) $(CHALLENGE08NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE08LAW) ||	\
		$(ECHO) "[KO]" $(CHALLENGE08LAW)
		@$(ECHO) "     [END challenge 08]"

clean:
		@$(RM) $(CHALLENGE08NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE08DEL) ||	\
		$(ECHO) "[KO]" $(CHALLENGE08DEL)

tests:
		@./test_challenge08.sh

fclean: clean

re_silent:
	@$(RM) $(CHALLENGE08NAME)
	@$(COPY) $(CHALLENGE08FILE) $(CHALLENGE08NAME)
	@$(CH) $(CHALLENGE08NAME)

re: fclean all

.PHONY:	all clean tests fclean re