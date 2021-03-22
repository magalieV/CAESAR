##
# File name : Makefile
# Abstract : Makefile of challenge03
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

#### -------------- Challenge 03 info -------------- ####
CHALLENGE03NAME	=	../challenge03
CHALLENGE03FILE	=	source03.py
CHALLENGE03SENT	=	"Copy source03.py to challenge03"
CHALLENGE03LAW	=	"Give execution right to challenge03"
CHALLENGE03DEL	=	"Delete challenge03"

#### -------------- CHALLENGE03 rules -------------- ####

all:
		@$(ECHO) "     [START challenge 03]"
		@$(COPY) $(CHALLENGE03FILE) $(CHALLENGE03NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE03SENT) ||	\
		$(ECHO) "[KO]" $(CHALLENGE03SENT)
		@$(CH) $(CHALLENGE03NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE03LAW) ||	\
		$(ECHO) "[KO]" $(CHALLENGE03LAW)
		@$(ECHO) "     [END challenge 03]"

clean:
		@$(RM) $(CHALLENGE03NAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGE03DEL) ||	\
		$(ECHO) "[KO]" $(CHALLENGE03DEL)

tests:
		@./test_challenge03.sh

fclean: clean

re_silent:
	@$(RM) $(CHALLENGE03NAME)
	@$(COPY) $(CHALLENGE03FILE) $(CHALLENGE03NAME)
	@$(CH) $(CHALLENGE03NAME)

re: fclean all

.PHONY:	all clean tests fclean re