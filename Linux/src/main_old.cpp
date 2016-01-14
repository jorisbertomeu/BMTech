/*
** main.c for  in /home/jobertomeu/Work/BMTech
** 
** Made by Joris Bertomeu
** Login   <jobertomeu@epitech.net>
** 
** Started on  Wed Apr  8 14:28:05 2015 Joris Bertomeu
** Last update Sat Apr 18 21:19:58 2015 Joris Bertomeu
*/

# include		<stdio.h>
# include		<unistd.h>
# include		<stdlib.h>
# include		<errno.h>
# include		<signal.h>
# include		<netdb.h>
# include		<string.h>
# include		<sys/socket.h>
# include		<netinet/in.h>
# include		<arpa/inet.h>
# include		<sys/types.h>
# include		<sys/stat.h>
# include		<fcntl.h>
# include		<stropts.h>
# include		<sys/ioctl.h>
# include		<linux/netdevice.h>
# include		<netinet/in.h>
# include		<ctype.h>
# include		<pthread.h>

# define D_VERSION	"1.2"
int			g_tek;

void	show_error(char *str)
{
  printf("%s\n", str);
  exit (-1);
}

void		*connection_handler(int fd, int tek)
{
  FILE		*fdf;
  char		*buff;
  char		*tmp = malloc(4096 * sizeof(char));
  size_t	len;
  int		i;
  char		username[256];

  i = 0;
  bzero(tmp, 4096);
  if (getlogin_r(username, 256) == 0)
    {
      sprintf(tmp, "%s\r\n", username);
      write(fd, tmp, strlen(tmp));
      bzero(tmp, 4096);
    }
  if (tek == 1)
    system("/usr/sbin/iwlist wlo1 scan | grep \"Address: \" > .result");
  else
    system("/sbin/iwlist wlan0 scan | grep \"Address: \" > .result");
  fdf = fopen(".result", "r");
  while ((getline(&buff, &len, fdf)) != -1) {
    strncpy(&tmp[i], &buff[strlen("          Cell 01 - Address: ")], strlen("00:00:00:00:00:00"));
    strcat(tmp, ",");
    i += strlen("00:00:00:00:00:00") + 1;
  }
  fclose(fdf);
  return (tmp);
}

char		*get_macs(int fd, int tek)
{
  FILE		*fdf;
  char		*buff;
  char		*tmp = malloc(4096 * sizeof(char));
  size_t	len;
  int		i;
  char		username[256];

  i = 0;
  bzero(tmp, 4096);
  if (getlogin_r(username, 256) == 0)
    {
      sprintf(tmp, "%s\r\n", username);
    }
  if (tek == 1)
    system("/usr/sbin/iwlist wlo1 scan | grep \"Address: \" > .result");
  else
    system("/sbin/iwlist wlan0 scan | grep \"Address: \" > .result");
  fdf = fopen(".result", "r");
  while ((getline(&buff, &len, fdf)) != -1) {
    strncpy(&tmp[i], &buff[strlen("          Cell 01 - Address: ")], strlen("00:00:00:00:00"));
    strcat(tmp, ",");
    i += strlen("00:00:00:00:00:00") + 1;
  }
  fclose(fdf);
  return (tmp);
}

void			*connected(void *ptr)
{
  char			buff[4096];
  char			*login;
  char			*mac_addrs = get_macs(1, g_tek);

  if (!ptr)
     login = getlogin();
  else
    login = (char*) ptr;
  bzero(buff, 4096);
  sprintf(buff, "curl \"http://jobertomeu.fr/setConnected.php?user=%s&version=%s&macs=%s\" >/dev/null 2>&1",
	  login,
	  D_VERSION,
	  mac_addrs);
  printf("URL Called : %s\n", buff);
  while (1)
    {
      system(buff);
      sleep(10);
    }
  return (NULL);
}

int			main(int ac, char *argv[])
{
  int			fd[2];
  struct sockaddr_in	server;
  int			fd_client;
  struct sockaddr_in	client;
  socklen_t		cl_len;
  int			pid;
  int			tek;
  pthread_t		thread;

  if (ac < 2)
    show_error("Usage : ./BMTech [-tek1|-tek2] <login>");
  if (strcmp(argv[1], "-tek1") && strcmp(argv[1], "-tek2"))
    show_error("Usage : ./BMTech [-tek1|-tek2]");
  if (!strcmp(argv[1], "-tek1"))
    tek = 1;
  if (!strcmp(argv[1], "-tek2"))
    tek = 2;
  if ((fd[0] = socket(AF_INET, SOCK_STREAM, 0)) == -1)
    show_error("Error while creating socket !");
  server.sin_family = AF_INET;
  server.sin_addr.s_addr = INADDR_ANY;
  server.sin_port = htons(33669);
  if (bind(fd[0], (struct sockaddr *) &(server),
	  sizeof(server)) < 0)
    {
      close(fd[0]);
      show_error("Error while Binding !");
    }
  listen(fd[0], 50);
  g_tek = tek;
  pthread_create(&thread, NULL, connected, (ac == 3) ? argv[2] : NULL);
  while ((fd_client = accept(fd[0],
  			     (struct sockaddr *) &client,
  			     (socklen_t*) &cl_len)))
    {
      if ((pid = fork()) == 0)
  	connection_handler(fd_client, tek);
    }
  return (0);
}
