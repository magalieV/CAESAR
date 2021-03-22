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
CHALLENGENAME	=	../challenge10
CHALLENGEFILE	=	source10.py
CHALLENGESENT	=	"Copy source10.py to challenge10"
CHALLENGELAW	=	"Give execution right to challenge10"
CHALLENGEDEL	=	"Delete challenge10"

#### -------------- CHALLENGE rules -------------- ####

all:
		@$(ECHO) "     [START challenge 10]"
		@$(COPY) $(CHALLENGEFILE) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGESENT) ||	\
		$(ECHO) "[KO]" $(CHALLENGESENT)
		@$(CH) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGELAW) ||	\
		$(ECHO) "[KO]" $(CHALLENGELAW)
		@$(ECHO) "     [END challenge 10]"

clean:
		@$(RM) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGEDEL) ||	\
		$(ECHO) "[KO]" $(CHALLENGEDEL)

tests:
		@./test_challenge10.sh

fclean: clean

re_silent:
	@$(RM) $(CHALLENGENAME)
	@$(COPY) $(CHALLENGEFILE) $(CHALLENGENAME)
	@$(CH) $(CHALLENGENAME)

re: fclean all

.PHONY:	all clean tests fclean re