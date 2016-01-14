#ifndef		_IPARAMETERS_HPP_
# define	_IPARAMETERS_HPP_

# include	<Utils.hpp>

# include	<stdlib.h>

class		Parameters;

typedef		int (Parameters::*mPtr)(int, char**, int);
typedef		std::list<void*> mMap;

class		IParameters
{
private:
  mMap		_ptrFunc;
  Parameters	*_me;

  typedef struct		s_parameter
  {
    std::string			*desc;
    std::list<std::string>	*options;
    mPtr			ptr;
  }				t_parameter;
  
public:
  void		parse(int ac, char **argv) {
    int		i;
    bool	founded;

    for (i = 1; i < ac; i++) {
      founded = false;
      for (mMap::iterator it = this->_ptrFunc.begin(); it != this->_ptrFunc.end(); ++it) {
	for (std::list<std::string>::iterator it2 = reinterpret_cast<t_parameter*>(*it)->options->begin(); it2 != reinterpret_cast<t_parameter*>(*it)->options->end(); ++it2) {
	  if (!(*it2).compare(std::string(argv[i]))) {
	    mPtr ptr = reinterpret_cast<t_parameter*>(*it)->ptr;
	    try {
	      i += (this->_me->*ptr)(ac, argv, i);
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

  void		showUsage() {
    std::cout << "Usage :" << std::endl << std::endl;
    for (mMap::iterator it = this->_ptrFunc.begin(); it != this->_ptrFunc.end(); ++it) {
      std::cout << "\t[";
      for (std::list<std::string>::iterator it2 = reinterpret_cast<t_parameter*>(*it)->options->begin();
	   it2 != reinterpret_cast<t_parameter*>(*it)->options->end(); ++it2) {
	std::cout << (*it2);
	if (it2 != --reinterpret_cast<t_parameter*>(*it)->options->end())
	  std::cout << "|";
      }
      std::cout << "]\t\t: " << *(reinterpret_cast<t_parameter*>(*it)->desc) << std::endl;
    };
  };
  
protected:
  void		addParameter(const std::string &option, mPtr ptr) {
    this->_ptrFunc.push_back(this->generatePtrFunc(option, ptr, "No description"));
  };

  void		addParameter(const std::string &option, mPtr ptr, const std::string &desc) {
    this->_ptrFunc.push_back(this->generatePtrFunc(option, ptr, desc));
  };
  
  explicit	IParameters(Parameters *me) : _me(me) {};
  
  t_parameter	*generatePtrFunc(const std::string &expr, mPtr ptr, const std::string &desc) {
    t_parameter	*tmp = reinterpret_cast<t_parameter*>(malloc(sizeof(t_parameter)));

    tmp->options = Utils::explode(expr, ':');
    tmp->ptr = ptr;
    tmp->desc = new std::string(desc);
    return (tmp);
  };
};

#endif
