#ifndef __StringTools_h__
#define __StringTools_h__

#include <vector>
#include <iostream>
#include <algorithm>
#include <string>
#include <sstream>

namespace Utilities
{
	/** \brief Tools to handle std::string objects 
	*/
	class StringTools
	{
	public:

		static void tokenize(const std::string& str, std::vector<std::string>& tokens, const std::string& delimiters = " ")
		{
			std::string::size_type lastPos = str.find_first_not_of(delimiters, 0);
			std::string::size_type pos = str.find_first_of(delimiters, lastPos);

			while (std::string::npos != pos || std::string::npos != lastPos)
			{
				tokens.push_back(str.substr(lastPos, pos - lastPos));
				lastPos = str.find_first_not_of(delimiters, pos);
				pos = str.find_first_of(delimiters, lastPos);
			}
		}

		/** converts a value to a string with a given precistion */
		template <typename T>
		static std::string to_string_with_precision(const T val, const int n = 6)
		{
			std::ostringstream ostr;
			ostr.precision(n);
			ostr << std::fixed << val;
			return ostr.str();
		}

		/** converts a double or a float to a string */
		template<typename T>
		static std::string real2String(const T r)
		{
			std::string str = to_string_with_precision(r,20);
			str.erase(str.find_last_not_of('0') + 1, std::string::npos);
			str.erase(str.find_last_not_of('.') + 1, std::string::npos);
			return str;
		}

		static std::string to_upper(const std::string& str)
		{
			std::string res = str;
			std::transform(res.begin(), res.end(), res.begin(), ::toupper);
			return res;
		}
	};
}

#endif
