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

  };
};

#endif
