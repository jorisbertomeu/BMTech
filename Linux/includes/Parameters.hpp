#ifndef		_PARAMETERS_HPP_
# define	_PARAMETERS_HPP_

# include	<string>
# include	<list>
# include	<map>
# include	<stdexcept>

# include	<IParameters.hpp>

class		Parameters :	public IParameters
{
private:
  std::string	_configFile;
  std::string	_login;
  std::string	_token;

public:
  explicit	Parameters() : IParameters(this) {
    this->addParameter("--config:-c", &Parameters::parseConfigFile,
		       "Allow to give a YML config file with all options described");
    this->addParameter("--login:-l", &Parameters::parseLogin,
		       "Specify student's login for authentication");
    this->addParameter("--token:-t", &Parameters::parseToken);
    this->addParameter("--help:-h", &Parameters::showHelp,
		       "Show this Usage");
  };
  
  void		verify() {
    std::cout << "Checking those parameters:" << std::endl << std::endl;
    std::cout << "\t* Config File\t : " << this->_configFile << std::endl;
    std::cout << "\t* Token\t\t : " << this->_token << std::endl;
    std::cout << "\t* Login\t\t : " << this->_login << std::endl;
  };

private:
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

  int		showHelp(int ac, char **argv, int idx) {
    (void) ac;
    (void) argv;
    (void) idx;
    this->showUsage();
    exit(0);
    return (0);
  };
};

#endif
