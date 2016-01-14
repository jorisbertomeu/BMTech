#ifndef		_BMTECH_HPP_
# define	_BMTECH_HPP_

# include	<stdexcept>
# include	<iostream>

# include	<Parameters.hpp>

class		BMTech
{
private:
  Parameters	_parameters;
  
public:
  explicit	BMTech() {};
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
