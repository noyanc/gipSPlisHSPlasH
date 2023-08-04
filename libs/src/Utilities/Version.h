#ifndef __Version_h__
#define __Version_h__

#define STRINGIZE_HELPER(x) #x
#define STRINGIZE(x) STRINGIZE_HELPER(x)
#define WARNING(desc) message(__FILE__ "(" STRINGIZE(__LINE__) ") : Warning: " #desc)

#define GIT_SHA1 "5aaa0349fa458d13d9b21fa223094be337364b59"
#define GIT_REFSPEC "refs/heads/master"
#define GIT_LOCAL_STATUS "CLEAN"

#define SPLISHSPLASH_VERSION "2.12.4"

#ifdef DL_OUTPUT

#endif

#endif
