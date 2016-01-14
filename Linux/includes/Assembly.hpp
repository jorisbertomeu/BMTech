#ifndef		_ASSEMBLY_HPP_
# define	_ASSEMBLY_HPP_

# include	<Conf.hh>
# include	<rapidjson/document.h>

# include	<string>

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
    std::cout << "Checking for update ...";

    Utils::httpRequest(this->_updateURL, TMP_FILE_UPDATE_REQUEST);
  };
};

#endif
