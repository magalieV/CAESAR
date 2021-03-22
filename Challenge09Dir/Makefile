##
# File name : Makefile
# Abstract : Makefile of challenge09
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
CHALLENGENAME	=	../challenge09
CHALLENGEFILE	=	source09.py
CHALLENGESENT	=	"Copy source09.py to challenge09"
CHALLENGELAW	=	"Give execution right to challenge09"
CHALLENGEDEL	=	"Delete challenge09"

#### -------------- CHALLENGE rules -------------- ####

all:
		@$(ECHO) "     [START challenge 09]"
		@$(COPY) $(CHALLENGEFILE) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGESENT) ||	\
		$(ECHO) "[KO]" $(CHALLENGESENT)
		@$(CH) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGELAW) ||	\
		$(ECHO) "[KO]" $(CHALLENGELAW)
		@$(ECHO) "     [END challenge 09]"

clean:
		@$(RM) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGEDEL) ||	\
		$(ECHO) "[KO]" $(CHALLENGEDEL)

tests:
		@./test_challenge09.sh

fclean: clean

re_silent:
	@$(RM) $(CHALLENGENAME)
	@$(COPY) $(CHALLENGEFILE) $(CHALLENGENAME)
	@$(CH) $(CHALLENGENAME)

re: fclean all

.PHONY:	all clean tests fclean re