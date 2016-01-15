CXX		=	g++ -g3

CXXFLAGS	+=	-W -Wextra -Wall -Iincludes -I.`pkg-config --cflags libcurl` -Irapidjson/include -Iyaml-cpp/include -std=c11

RM		=	rm -f

SRC		=	src/main.cpp				\

OBJ		=	$(SRC:.cpp=.o)

NOM		=	BMTech

all:		$(NOM)

$(NOM):		$(OBJ)
		@echo -e "\n > COMPILATION DES .CPP BMTECH EN COURS\n"
		$(CXX) -o $(NOM) $(OBJ) -ldl -Lyaml-cpp/build -lyaml-cpp `pkg-config --libs libcurl`
		@echo -e "\n > COMPILATION DES .CPP BMTECH TERMINEE"

clean:
		@echo -e "\t->>> SUPPRESSION DES .o <<<-"
		$(RM) $(OBJ)

fclean:		clean
		$(RM) $(NOM)

re:		fclean all

.PHONY:		all clean fclean re
