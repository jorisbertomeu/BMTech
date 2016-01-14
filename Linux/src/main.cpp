#include	<BMTech.hpp>

int	main(int ac, char *argv[])
{
  BMTech	app;

  try {
    app.init(ac, argv);
    app.start();
  } catch (const std::exception &e) {
    std::cout << "Error : " << e.what() << std::endl;
  }
  return (0);
}
