##
# File name : Makefile
# Abstract : Makefile of challenge03
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 05/01/2021
# Last modification : 05/01/2021
##

#### -------------- Global variables -------------- ####
RM				=	rm -rf

COPY			=	cp

CH				= chmod 755

ECHO			= echo

MAKEFLAGS	+=	--no-print-directory

#### -------------- Challenge 03 info -------------- ####
CHALLENGE05NAME	=	../challenge05
CHALLENGE05FILE	=	source05.py
CHALLENGE05SENT	=	"Copy source05.py to challenge05"
CHALLENGE05LAW	=	"Give execution right to challenge05"
CHALLENGE05DEL	=	"Delete challenge05"

#### -------------- CHALLENGE03 rules -------------- ####

all:
		@$(ECHO) "     [START challenge 05]"
		@$(COPY) $(CHALLENGE05FILE) $(CHALLENGE05NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE05SENT) ||	\
		$(ECHO) "[KO]" $(CHALLENGE05SENT)
		@$(CH) $(CHALLENGE05NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE05LAW) ||	\
		$(ECHO) "[KO]" $(CHALLENGE05LAW)
		@$(ECHO) "     [END challenge 05]"

clean:
		@$(RM) $(CHALLENGE05NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE05DEL) ||	\
		$(ECHO) "[KO]" $(CHALLENGE05DEL)

tests:
		@./test_challenge05.sh

fclean: clean

re_silent:
	@$(RM) $(CHALLENGE05NAME)
	@$(COPY) $(CHALLENGE05FILE) $(CHALLENGE05NAME)
	@$(CH) $(CHALLENGE05NAME)

re: fclean all

.PHONY:	all clean tests fclean re