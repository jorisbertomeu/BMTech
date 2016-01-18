//
// Utils.hpp for  in /home/Dieu/Desktop/Work/BMTech/Linux
// 
// Made by Dieu Dieu
// Login   <Dieu@epitech.net>
// 
// Started on  Mon Jan 18 15:20:12 2016 Dieu Dieu
// Last update Mon Jan 18 15:20:14 2016 Dieu Dieu
//

#ifndef		_UTILS_HPP_
# define	_UTILS_HPP_

# include	<vector>
# include	<string>
# include	<sstream>
# include	<stdexcept>
# include	<curl/curl.h>

static size_t write_data(void *ptr, size_t size, size_t nmemb, void *stream)
{
  int written = fwrite(ptr, size, nmemb, (FILE *)stream);
  return written;
}

class		Utils
{
public:
  static std::list<std::string> *explode(const std::string& str, char sep)
  {
    std::list<std::string>	*tokens = new std::list<std::string>;
    std::istringstream		split(str);
    
    for (std::string each; std::getline(split, each, sep); tokens->push_back(each));
    return (tokens);
  };

  static void			httpRequest(const std::string &url, const std::string &dest) {
    CURL			*curl;
    CURLcode			res;
    FILE			*fp;

    curl = curl_easy_init();
    if (curl) {
      fp = fopen(dest.c_str(), "wb");
      curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
      curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
      curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
      curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
      res = curl_easy_perform(curl);
      if (res != CURLE_OK)
	throw std::logic_error(std::string("curl_easy_perform() failed: " +
					   std::string(curl_easy_strerror(res))));
      curl_easy_cleanup(curl);
      fclose(fp);
    }
  };
};

#endif
