##
# File name : Makefile
# Abstract : Makefile of the project
# Authors : Magalie Vandenbriele and Christelle Heitzler
# Date : 04/01/2021
# Last modification : 15/01/2021
##

#### -------------- Global variables -------------- ####
RM				=	rm -rf

COPY			=	cp

CH				= chmod 755

ECHO			= echo

TEST_OUTPUT		= result.txt

MAKEFLAGS	+=	--no-print-directory

#### -------------- Challenges directory path -------------- ####

CHALLENGE01DIR	=	Challenge01Dir/

CHALLENGE02DIR	=	Challenge02Dir/

CHALLENGE03DIR	=	Challenge03Dir/

CHALLENGE04DIR	=	Challenge04Dir/

CHALLENGE05DIR	=	Challenge05Dir/

CHALLENGE06DIR	=	Challenge06Dir/

CHALLENGE07DIR	=	Challenge07Dir/

CHALLENGE08DIR	=	Challenge08Dir/

CHALLENGE09DIR	=	Challenge09Dir/

CHALLENGE10DIR	=	Challenge10Dir/

CHALLENGE11DIR	=	Challenge11Dir/

CHALLENGE12DIR	=	Challenge12Dir/

CHALLENGE13DIR	=	Challenge13Dir/

#### -------------- Global rules -------------- ####

all:
			@make -C $(CHALLENGE01DIR)
			@make -C $(CHALLENGE02DIR)
			@make -C $(CHALLENGE03DIR)
			@make -C $(CHALLENGE04DIR)
			@make -C $(CHALLENGE05DIR)
			@make -C $(CHALLENGE06DIR)
			@make -C $(CHALLENGE07DIR)
			@make -C $(CHALLENGE08DIR)
			@make -C $(CHALLENGE09DIR)
			@make -C $(CHALLENGE10DIR)
			@make -C $(CHALLENGE11DIR)
			@make -C $(CHALLENGE12DIR)
			@make -C $(CHALLENGE13DIR)

#### -------------- Directory rule -------------- ####

challenge01D:
		@make -C $(CHALLENGE01DIR)

challenge02D:
		@make -C $(CHALLENGE02DIR)

challenge03D:
		@make -C $(CHALLENGE03DIR)

challenge04D:
		@make -C $(CHALLENGE04DIR)

challenge05D:
		@make -C $(CHALLENGE05DIR)

challenge06D:
		@make -C $(CHALLENGE06DIR)

challenge07D:
		@make -C $(CHALLENGE07DIR)

challenge08D:
		@make -C $(CHALLENGE08DIR)

challenge09D:
		@make -C $(CHALLENGE09DIR)

challenge10D:
		@make -C $(CHALLENGE10DIR)

challenge11D:
		@make -C $(CHALLENGE11DIR)

challenge12D:
		@make -C $(CHALLENGE12DIR)

challenge13D:
		@make -C $(CHALLENGE13DIR)

### -------------- Rules cleaning -------------- ####

clean:
	@make clean -C $(CHALLENGE01DIR)
	@make clean -C $(CHALLENGE02DIR)
	@make clean -C $(CHALLENGE03DIR)
	@make clean -C $(CHALLENGE04DIR)
	@make clean -C $(CHALLENGE05DIR)
	@make clean -C $(CHALLENGE06DIR)
	@make clean -C $(CHALLENGE07DIR)
	@make clean -C $(CHALLENGE08DIR)
	@make clean -C $(CHALLENGE09DIR)
	@make clean -C $(CHALLENGE10DIR)
	@make clean -C $(CHALLENGE11DIR)
	@make clean -C $(CHALLENGE12DIR)
	@make clean -C $(CHALLENGE13DIR)

fclean:
	@make fclean -C $(CHALLENGE01DIR)
	@make fclean -C $(CHALLENGE02DIR)
	@make fclean -C $(CHALLENGE03DIR)
	@make fclean -C $(CHALLENGE04DIR)
	@make fclean -C $(CHALLENGE05DIR)
	@make fclean -C $(CHALLENGE05DIR)
	@make fclean -C $(CHALLENGE06DIR)
	@make fclean -C $(CHALLENGE07DIR)
	@make fclean -C $(CHALLENGE08DIR)
	@make fclean -C $(CHALLENGE09DIR)
	@make fclean -C $(CHALLENGE10DIR)
	@make fclean -C $(CHALLENGE11DIR)
	@make fclean -C $(CHALLENGE12DIR)
	@make fclean -C $(CHALLENGE13DIR)


re: fclean all

tests:
	@make tests -C $(CHALLENGE01DIR)
	@make tests -C $(CHALLENGE02DIR)
	@make tests -C $(CHALLENGE03DIR)
	@make tests -C $(CHALLENGE04DIR)
	@make tests -C $(CHALLENGE05DIR)
	@make tests -C $(CHALLENGE06DIR)
	@make tests -C $(CHALLENGE07DIR)
	@make tests -C $(CHALLENGE08DIR)
	@make tests -C $(CHALLENGE09DIR)

execute_tests:
	@$(ECHO) "[Execute tests]"
	@make tests > $(TEST_OUTPUT)
	@$(ECHO) "-> Result write in result.txt"

clean_tests:
	@$(ECHO) "[Clean tests]"
	@$(RM) $(TEST_OUTPUT)

.PHONY:	clean flcean re all challenge01D challenge02D challenge03D challenge04D challenge05D challenge06D challenge07D challenge08D challenge09D challenge10D challenge11D challenge12D challenge13D challenge14D tests