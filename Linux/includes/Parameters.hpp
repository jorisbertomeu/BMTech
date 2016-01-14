#ifndef		_PARAMETERS_HPP_
# define	_PARAMETERS_HPP_

# include	<string>
# include	<list>
# include	<map>
# include	<stdexcept>

# include	<Utils.hpp>

class		Parameters;

typedef int (Parameters::*mPtr)(int, char**, int);
typedef	std::map<std::list<std::string>, mPtr> mMap;

class		Parameters
{
private:
  std::string	_configFile;
  std::string	_login;
  std::string	_token;
  mMap		_ptrFunc;

public:
  explicit	Parameters() {
    this->_ptrFunc.insert(this->generatePtrFunc("--config:-c", &Parameters::parseConfigFile));
    this->_ptrFunc.insert(this->generatePtrFunc("--login:-l", &Parameters::parseLogin));
    this->_ptrFunc.insert(this->generatePtrFunc("--token:-t", &Parameters::parseToken));
  };
  
  void		parse(int ac, char **argv) {
    int		i;
    bool	founded;

    for (i = 1; i < ac; i++) {
      founded = false;
      for (mMap::iterator it = this->_ptrFunc.begin(); it != this->_ptrFunc.end(); ++it) {
	for (std::list<std::string>::const_iterator it2 = it->first.begin(); it2 != it->first.end(); ++it2) {
	  if (!(*it2).compare(std::string(argv[i]))) {
	    mPtr ptr = it->second;
	    try {
	      i += (this->*ptr)(ac, argv, i);
	      founded = true;
	    } catch (const std::exception &e) {
	      throw (std::logic_error(e.what()));
	    }
	  }
	}
      }
      if (!founded)
	throw (std::logic_error("Unknown argument \"" + std::string(argv[i]) + "\""));
    }
  };

  void		verify() {
    std::cout << "Checking those parameters:" << std::endl << std::endl;
    std::cout << "\t* Config File\t : " << this->_configFile << std::endl;
    std::cout << "\t* Token\t\t : " << this->_token << std::endl;
    std::cout << "\t* Login\t\t : " << this->_login << std::endl;
  };

private:
  std::pair<std::list<std::string>, mPtr>	generatePtrFunc(const std::string &expr, mPtr ptr) {
    std::list<std::string>			opt = Utils::explode(expr, ':');
    
    return (std::pair<std::list<std::string>, mPtr>(opt, ptr));
  };
  
  int		parseConfigFile(int ac, char **argv, int idx) {
    if (ac > idx + 1)
      this->_configFile = std::string(argv[idx + 1]);
    else
      throw (std::logic_error("[-c|--config] required a path"));
    return (1);
  };

  int		parseLogin(int ac, char **argv, int idx) {
    if (ac > idx + 1)
      this->_login = std::string(argv[idx + 1]);
    else
      throw (std::logic_error("[-l|--login] required a login value"));    
    return (1);
  };

  int		parseToken(int ac, char **argv, int idx) {
    if (ac > idx + 1)
      this->_token = std::string(argv[idx + 1]);
    else
      throw (std::logic_error("[-t|--token] required a token value"));
    return (1);
  };

};

#endif
