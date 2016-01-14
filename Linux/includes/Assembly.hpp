#ifndef		_ASSEMBLY_HPP_
# define	_ASSEMBLY_HPP_

# include	<Conf.hh>
# include	<rapidjson/document.h>
# include	<rapidjson/filereadstream.h>

# include	<string>

using namespace rapidjson;
class		Assembly
{
private:
  std::string	_version;
  std::string	_author;
  std::string	_name;
  std::string	_updateURL;
  
public:
  void		set(const std::string &version, const std::string &author, const std::string &name) {
    this->_version = version;
    this->_author = author;
    this->_name = name;
  };

  std::string	getVersion() const {
    return (_version);
  };

  std::string	getAuthor() const {
    return (_author);
  };

  std::string	getName() const {
    return (_name);
  };

  void		setUpdateURL(const std::string &url) {
    this->_updateURL = url;
  };

  void		checkForUpdate() {
    FILE	*fp;
    char	readBuffer[4096];
    Document	d;
    
    std::cout << "Checking for update ... ";
    try {
      Utils::httpRequest(this->_updateURL, TMP_FILE_UPDATE_REQUEST);
    } catch (const std::exception &e) {
      std::cout << "\tError : " << e.what() << std::endl;
    };
    if (!(fp = fopen(TMP_FILE_UPDATE_REQUEST, "rb"))) {
      std::cout << "\tError while fetching data" << std::endl;
    }
    FileReadStream is(fp, readBuffer, sizeof(readBuffer));
    d.ParseStream(is);
    if (!d.IsObject()) {
      std::cout << "\tBad API Result" << std::endl;
      fclose(fp);
      return;
    }
    if (atof(d["version"].GetString()) > atof(this->_version.c_str())) {
      std::cout << "\t\033[32mNew version (" << d["version"].GetString() << ") is available !\033[0m" << std::endl;
      std::cout << "\033[31m/!\\ You MUST update your BMTech ! Please, go to http://jobertomeu.fr/bmtech\033[0m" << std::endl;
      exit (-1);
    } else if (atof(d["version"].GetString()) == atof(this->_version.c_str()))
      std::cout << "\tYou are up-to-date !" << std::endl;
    else {
      std::cout << "\tWTF ? Are you Marty Mcfly ?" << std::endl;
      std::cout << "Sorry, but you have to go away ... Exiting" << std::endl;
    }
    fclose(fp);
  };
};

#endif
