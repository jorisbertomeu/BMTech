//
// BMTech.hpp for  in /home/Dieu/Desktop/Work/BMTech/Linux
// 
// Made by Dieu Dieu
// Login   <Dieu@epitech.net>
// 
// Started on  Mon Jan 18 15:20:37 2016 Dieu Dieu
// Last update Mon Jan 18 17:06:08 2016 Dieu Dieu
//

#ifndef		_BMTECH_HPP_
# define	_BMTECH_HPP_

# include	<stdexcept>
# include	<iostream>
# include	<stdio.h>

# include	<Parameters.hpp>
# include	<Assembly.hpp>
# include	<Utils.hpp>

class		BMTech
{
private:
  Parameters	_parameters;
  Assembly	_assembly;
  
public:
  explicit	BMTech() {
    this->_assembly.set(D_VERSION, "Joris Bertomeu - joris.bertomeu@epitech.eu", "BMTech");
    this->_assembly.setUpdateURL("http://jobertomeu.fr/bmtech/servlet/getLastVersion.php");
    this->_assembly.checkForUpdate();
  };
  
  virtual	~BMTech() {};
  void		init(int ac, char **argv) {
    try {
      this->_parameters.parse(ac, argv);
      this->_parameters.verify();
    } catch (const std::exception &e) {
      throw (std::logic_error(e.what()));
    }
  };

  void		start() {
    FILE	*fd;
    size_t	len, i;
    char	*buff;
    char	*tmp = (char*) malloc(4096);

    while (true) {
      i = 0;
      bzero(tmp, 4096);
      if (this->_parameters.getIsSudo())
	system("sudo iwlist wlo1 scan | grep 'Address' > .results");
      else
	system("iwlist wlo1 scan | grep 'Address' > .results");
      if (!(fd = fopen(".results", "r")))
	throw std::logic_error("BMTech :: Start :: Error while openning local file, check access right !");      
      while ((getline(&buff, &len, fd)) != -1) {
	strncpy(&tmp[i], &buff[strlen("          Cell 01 - Address: ")], strlen("00:00:00:00:00:00"));
	strcat(tmp, ",");
	i += strlen("00:00:00:00:00:00") + 1;
      }
      try {
	Utils::httpRequest(std::string(URL_SERVLET_SETCONNECTED) + 
			   std::string("?user=") + 
			   this->_parameters.getLogin() + 
			   std::string("&version=") + 
			   std::string(D_VERSION) + 
			   std::string("&macs=") + 
			   std::string(tmp), TMP_FILE_MAIN_REQUEST);
      } catch (const std::exception &e) {
	std::cout << "Error : " << e.what() << std::endl;
      }
      fclose(fd);
      sleep(9);
    }
  };
};

#endif
