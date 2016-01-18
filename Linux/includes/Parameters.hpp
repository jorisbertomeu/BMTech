//
// Parameters.hpp for  in /home/Dieu/Desktop/Work/BMTech/Linux
// 
// Made by Dieu Dieu
// Login   <Dieu@epitech.net>
// 
// Started on  Mon Jan 18 15:20:21 2016 Dieu Dieu
// Last update Mon Jan 18 15:42:25 2016 Dieu Dieu
//

#ifndef		_PARAMETERS_HPP_
# define	_PARAMETERS_HPP_

# include	<string>
# include	<list>
# include	<map>
# include	<stdexcept>
# include	<unistd.h>
# include	<fstream>
# include	<yaml-cpp/yaml.h>
# include	<rapidjson/document.h>
# include	<rapidjson/filereadstream.h>
# include	<sys/types.h>
# include	<sys/stat.h>

# include	<IParameters.hpp>
# include	<Conf.hh>

using namespace rapidjson;
class		Parameters :	public IParameters
{
private:
  std::string	_configFile;
  std::string	_login;
  std::string	_token;
  std::string	_incoming;
  bool		_airtech;
  std::string	_airtechServer;
  bool		_isSudo;
  
public:
  explicit	Parameters() : IParameters(this) {
    setlocale(LC_ALL, "");
    this->_airtech = false;
    this->_isSudo = false;
    this->addParameter("--config:-c", &Parameters::parseConfigFile,
		       "Allow to give a YML config file with all options described");
    this->addParameter("--login:-l", &Parameters::parseLogin,
		       "Specify student's login for authentication");
    this->addParameter("--token:-t", &Parameters::parseToken,
		       "You MUST Specify your token API associated to your login");
    this->addParameter("--sudo:-s", &Parameters::parseSudo,
		       "More details with sudo flag. You must be sudoer");
    this->addParameter("--incoming:-i", &Parameters::parseIncoming,
		       "Incoming folder destination for AirTech (c)");
    this->addParameter("--airtech:-a", &Parameters::parseAirtech,
		       "Enable Airtech mechanism - AirDrop Like, multiOS");
    this->addParameter("--airtech_server:-as", &Parameters::parseAirtechServer,
		       "Specify Airtech server IP");
    this->addParameter("--help:-h", &Parameters::showHelp,
		       "Show this Usage");
  };

  bool		getIsSudo() const {
    return (this->_isSudo);
  };
  
  void		verify() {
    bool	validCF = false, underline = false;
    int		tests = 0;
    
    std::cout << "Checking those parameters :" << std::endl;

    //Checking if file exists
    if (access(this->_configFile.c_str(), F_OK) != -1) {
      std::cout << "\t\033[32m[OK]";
      validCF = true;
    } else {
      std::cout << "\t\033[36m[KO]";
      underline = true;
    }
    std::cout << "\033[0m Config File existance\t : " << ((underline) ? "\033[33m\033[4m" : "")
	      << ((this->_configFile.length() == 0) ? "<empty>" : this->_configFile) << "\033[0m" << std::endl;
    if (validCF) {
      if (parseFile())
	std::cout << "\t\033[32m[OK]";
      else {
	std::cout << "\t\033[31m[KO]";
	underline = true;
      }
    } else
      std::cout << "\t\033[33m[??]";
    std::cout << "\033[0m Config File validity\t : " << ((underline) ? "\033[33m\033[4m" : "")
	      << ((this->_configFile.length() == 0) ? "<empty>" : this->_configFile) << "\033[0m" << std::endl;
    
    //Checking for Login exists
    this->genericCheck(this->_login, "Login integrity", &Parameters::validLogin);

    //Checking for Token API for this login
    this->genericCheck(this->_token, "Token validity", &Parameters::validToken);
    
    //Checking for incoming folder for AirTech
    this->genericCheck(this->_incoming, "Incoming Folder", &Parameters::validIncoming);
    
    //Checking for Airtech server availability
    if (this->_airtech) {
      underline = false;
      if (this->checkAirtechServer())
	std::cout << "\t\033[32m[OK]";
      else {
	std::cout << "\t\033[31m[KO]";
	underline = true;
      }
      std::cout << "\033[0m AirTech Server\t\t : " << ((underline) ? "\033[33m\033[4m" : "")
		<< ((underline) ? "Down" : "Active") << "\033[0m"  << std::endl;
    }
      
    if (tests != 0)
      std::cout << std::to_string(tests) << "/2 mandatories failed ..." << std::endl;
    else
      this->_isOk = true;
  };

private:
  bool			checkAirtechServer() {
    if (this->_airtechServer.length() == 0) {
      std::cerr << "\t\t\t\t\t    \u2B10 You must specify an Airtech Server !" << std::endl;
      return false;
    }
    return true;
  };
  
  bool			validIncoming() {
    struct stat		info;

    if (stat(this->_incoming.c_str(), &info) != 0) {
      std::cerr << "\t\t\t\t\t    \u2B10 " << this->_incoming << " is not reacheable" << std::endl;
      return false;
    } else if (info.st_mode & S_IFDIR)
      return true;
    else
      std::cerr << "\t\t\t\t\t    \u2B10 " << this->_incoming << " must be a directory !" << std::endl;
    return false;
  };

  bool			validLogin() {
    FILE		*fp;
    char		readBuffer[4096];
    Document		d;
    
    try {
      Utils::httpRequest(URL_SERVLET_GETLOGINS, TMP_FILE_GETLOGINS_REQUEST);
    } catch (const std::exception &e) {
      std::cerr << "\t\t\t\t\t    \u2B10 " << e.what() << std::endl;
      return false;
    }
    if (!(fp = fopen(TMP_FILE_GETLOGINS_REQUEST, "rb"))) {
      std::cerr << "\t\t\t\t\t    \u2B10 " << "Error while fetching data" << std::endl;
      return false;
    }
    FileReadStream is(fp, readBuffer, sizeof(readBuffer));
    d.ParseStream(is);
    if (!d.IsObject()) {
      std::cerr << "\t\t\t\t\t    \u2B10 " << "Bad API Result" << std::endl;
      fclose(fp);
      return false;
    }
    for (Value::ConstValueIterator itr = d["results"].Begin(); itr != d["results"].End(); ++itr) {
      if (!std::string(itr->GetString()).compare(this->_login))
	return true;
    }
    std::cerr << "\t\t\t\t\t    \u2B10 " << "Login unknown ..." << std::endl;
    return false;
  };

  bool			validToken() {
    FILE		*fp;
    char		readBuffer[4096];
    Document		d;

    try {
      Utils::httpRequest(std::string(URL_SERVLET_CHECKTOKEN + std::string("?token=") + this->_token), TMP_FILE_CHECKTOKEN_REQUEST);
    } catch (const std::exception &e) {
      std::cerr << "\t\t\t\t\t    \u2B10 " << e.what() << std::endl;
      return false;
    }
    if (!(fp = fopen(TMP_FILE_CHECKTOKEN_REQUEST, "rb"))) {
      std::cerr << "\t\t\t\t\t    \u2B10 " << "Error while fetching data" << std::endl;
      return false;
    }
    FileReadStream is(fp, readBuffer, sizeof(readBuffer));
    d.ParseStream(is);
    if (!d.IsObject()) {
      std::cerr << "\t\t\t\t\t    \u2B10 " << "Bad API Result" << std::endl;
      fclose(fp);
      return false;
    }
    for (Value::ConstValueIterator itr = d["results"].Begin(); itr != d["results"].End(); ++itr) {
      if (!std::string(itr->GetString()).compare(this->_login))
	return true;
    }
    std::cerr << "\t\t\t\t\t    \u2B10 " << "Bad login/token ..." << std::endl;
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
    if (config["incoming"]) {
      this->_incoming = std::string(config["incoming"].as<std::string>());
    }
   if (config["airtech"]) {
      this->_airtech = config["airtech"].as<bool>();
    }
   if (config["airtech_server"]) {
     this->_airtechServer = std::string(config["airtech_server"].as<std::string>());
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

  int		parseSudo(int ac, char **argv, int idx) {
    (void) ac;
    (void) argv;
    (void) idx;
    
    this->_isSudo = true;
    return (0);
  };

  int		parseToken(int ac, char **argv, int idx) {
    if (ac > idx + 1)
      this->_token = std::string(argv[idx + 1]);
    else
      throw (std::logic_error("[-t|--token] required a token value"));
    return (1);
  };

  int		parseIncoming(int ac, char **argv, int idx) {
    if (ac > idx + 1)
      this->_incoming = std::string(argv[idx + 1]);
    else
      throw (std::logic_error("[-i|--incoming] required a path"));
    return (1);
  };

  int		parseAirtechServer(int ac, char **argv, int idx) {
    if (ac > idx + 1)
      this->_airtechServer = std::string(argv[idx + 1]);
    else
      throw (std::logic_error("[-as|--airtech_server] required a server IP"));
    return (1);
  };
  
  int		parseAirtech(int ac, char **argv, int idx) {
    (void) ac;
    (void) argv;
    (void) idx;
    this->_airtech = true;
    return (0);
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
