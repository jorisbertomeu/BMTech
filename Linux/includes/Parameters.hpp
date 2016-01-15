#ifndef		_PARAMETERS_HPP_
# define	_PARAMETERS_HPP_

# include	<string>
# include	<list>
# include	<map>
# include	<stdexcept>
# include	<unistd.h>
# include	<fstream>
# include	<yaml-cpp/yaml.h>

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
    bool	validCF = false;
    
    std::cout << "Checking those parameters :" << std::endl;

    //Checking for file exists
    if (access(this->_configFile.c_str(), F_OK) != -1) {
      std::cout << "\t\033[32m[OK]";
      validCF = true;
    } else {
      std::cout << "\t\033[31m[KO]";
    }
    std::cout << "\033[0m Config File existance\t : " << this->_configFile << std::endl;
    if (validCF) {
      if (parseFile())
	std::cout << "\t\033[32m[OK]";
      else
	std::cout << "\t\033[31m[KO]";
    } else
      std::cout << "\t\033[31m[KO]";
    std::cout << "\033[0m Config File validity\t : " << this->_configFile << std::endl;
    
    //Checking for Login exists
    if (this->_login.length() == 0)
      std::cout << "\t\033[31m[KO]";
    else {
     if (this->validLogin())
	std::cout << "\t\033[32m[OK]";
      else
	std::cout << "\t\033[31m[KO]";
     }
    std::cout << "\033[0m Login\t\t\t : " << ((this->_login.length() == 0) ? "<empty>" :
					      this->_login) << std::endl;

    //Checking for Token API for this login
    if (this->_token.length() == 0)
      std::cout << "\t\033[31m[KO]";
    else {
      if (this->validToken())
	std::cout << "\t\033[32m[OK]";
      else
	std::cout << "\t\033[31m[KO]";
    }
    std::cout << "\033[0m Token\t\t\t : " << ((this->_token.length() == 0) ? "<empty>" :
					      this->_token) << std::endl;
  };

private:
  bool			validLogin() {
    return true;
  };

  bool			validToken() {
    return false;
  };
  
  bool			parseFile() {
    YAML::Node		config = YAML::LoadFile(this->_configFile);

    if (config["login"]) {
      this->_login = std::string(config["login"].as<std::string>());
    }
    if (config["token"]) {
      this->_token = std::string(config["token"].as<std::string>());
    }
    return (true);
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
