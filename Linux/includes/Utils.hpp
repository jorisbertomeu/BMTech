#ifndef		_UTILS_HPP_
# define	_UTILS_HPP_

# include	<vector>
# include	<string>
# include	<sstream>

class		Utils
{
public:
  static std::list<std::string>& explode(const std::string& str)
  {
    std::list<std::string>	*tokens = new std::list<std::string>;
    std::istringstream		split(str);
    
    for (std::string each; std::getline(split, each, ':'); tokens->push_back(each));
    return (*tokens);
  };
};

#endif
