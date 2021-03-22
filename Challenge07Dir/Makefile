##
# File name : Makefile
# Abstract : Makefile of challenge07
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 15/01/2021
# Last modification : 15/01/2021
##

#### -------------- Global variables -------------- ####
RM				=	rm -rf

COPY			=	cp

CH				= chmod 755

ECHO			= echo

MAKEFLAGS	+=	--no-print-directory

#### -------------- Challenge info -------------- ####
CHALLENGENAME	=	../challenge07
CHALLENGEFILE	=	source07.py
CHALLENGESENT	=	"Copy source07.py to challenge07"
CHALLENGELAW	=	"Give execution right to challenge07"
CHALLENGEDEL	=	"Delete challenge07"

#### -------------- CHALLENGE rules -------------- ####

all:
		@$(ECHO) "     [START challenge 07]"
		@$(COPY) $(CHALLENGEFILE) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGESENT) ||	\
		$(ECHO) "[KO]" $(CHALLENGESENT)
		@$(CH) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGELAW) ||	\
		$(ECHO) "[KO]" $(CHALLENGELAW)
		@$(ECHO) "     [END challenge 07]"

clean:
		@$(RM) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGEDEL) ||	\
		$(ECHO) "[KO]" $(CHALLENGEDEL)

tests:
		@./test_challenge07.sh

fclean: clean

re_silent:
	@$(RM) $(CHALLENGENAME)
	@$(COPY) $(CHALLENGEFILE) $(CHALLENGENAME)
	@$(CH) $(CHALLENGENAME)

re: fclean all

.PHONY:	all clean tests fclean re