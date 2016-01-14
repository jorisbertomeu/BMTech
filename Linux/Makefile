CXX		=	g++ -g3

CXXFLAGS	+=	-W -Wextra -Wall -Iincludes -I.`pkg-config --cflags libcurl`

RM		=	rm -f

SRC		=	src/main.cpp				\

OBJ		=	$(SRC:.cpp=.o)

NOM		=	BMTech

all:		$(NOM)

$(NOM):		$(OBJ)
		@echo -e "\n > COMPILATION DES .CPP BMTECH EN COURS\n"
		$(CXX) -o $(NOM) $(OBJ) -ldl `pkg-config --libs libcurl`
		@echo -e "\n > COMPILATION DES .CPP BMTECH TERMINEE"

clean:
		@echo -e "\t->>> SUPPRESSION DES .o <<<-"
		$(RM) $(OBJ)

fclean:		clean
		$(RM) $(NOM)

re:		fclean all

.PHONY:		all clean fclean re
