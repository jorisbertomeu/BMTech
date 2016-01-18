//
// BMTech.hpp for  in /home/Dieu/Desktop/Work/BMTech/Linux
// 
// Made by Dieu Dieu
// Login   <Dieu@epitech.net>
// 
// Started on  Mon Jan 18 15:20:37 2016 Dieu Dieu
// Last update Mon Jan 18 15:42:53 2016 Dieu Dieu
//

#ifndef		_BMTECH_HPP_
# define	_BMTECH_HPP_

# include	<stdexcept>
# include	<iostream>

# include	<Parameters.hpp>
# include	<Assembly.hpp>

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
    while (true) {
      if (this->_parameters.getIsSudo())
	system("sudo iwlist wlo1 scan | grep 'Address\\|Quality' > .results");
      else
	system("iwlist wlo1 scan | grep 'Address\\|Quality' > .results");
      system("wc -l .results");
      sleep(9);
    }
  };
};

#endif
