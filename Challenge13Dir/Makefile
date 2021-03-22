##
# File name : Makefile
# Abstract : Makefile of challenge13
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 15/01/2021
# Last modification : 20/01/2021
##

#### -------------- Global variables -------------- ####
RM				=	rm -rf

COPY			=	cp

CH				= chmod 755

ECHO			= echo

MAKEFLAGS	+=	--no-print-directory

#### -------------- Challenge info -------------- ####
CHALLENGENAME	=	../challenge13
CHALLENGEFILE	=	source13.py
CHALLENGESENT	=	"Copy source13.py to challenge13"
CHALLENGELAW	=	"Give execution right to challenge13"
CHALLENGEDEL	=	"Delete challenge13"

#### -------------- CHALLENGE rules -------------- ####

all:
		@$(ECHO) "     [START challenge 13]"
		@$(COPY) $(CHALLENGEFILE) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGESENT) ||	\
		$(ECHO) "[KO]" $(CHALLENGESENT)
		@$(CH) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGELAW) ||	\
		$(ECHO) "[KO]" $(CHALLENGELAW)
		@$(ECHO) "     [END challenge 13]"

clean:
		@$(RM) $(CHALLENGENAME) &&			\
		$(ECHO) "[OK]" $(CHALLENGEDEL) ||	\
		$(ECHO) "[KO]" $(CHALLENGEDEL)

fclean: clean

re_silent:
	@$(RM) $(CHALLENGENAME)
	@$(COPY) $(CHALLENGEFILE) $(CHALLENGENAME)
	@$(CH) $(CHALLENGENAME)

re: fclean all

.PHONY:	all clean tests fclean re