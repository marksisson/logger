#include <iostream>

#include <syslog.h>

auto posix() -> int
{
    std::cout << "posix" << std::endl;

    int previous_mask = setlogmask(0);


    int default_facility = LOG_USER;
//    openlog(NULL, LOG_PID|LOG_NDELAY|LOG_NOWAIT, default_facility);
    openlog("MARKMARK", LOG_PID|LOG_NDELAY|LOG_NOWAIT, default_facility);

    // priority of messsage
    // 0 - Emergency
    // 1 - Alert
    // 2 - Critical
    // 3 - Error
    // 4 - Warning
    // 5 - Notice
    // 6 - Info
    // 7 - Debug

//    setlogmask(LOG_UPTO(LOG_WARNING));
    setlogmask(LOG_MASK(LOG_CRIT|LOG_INFO));

    int default_priority = LOG_INFO;
    syslog(default_priority , "%s", "This is a syslog test");

    closelog();

    return 0;
}
