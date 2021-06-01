#include <iostream>
#include <cstdlib>
#include <optional>

#import <os/log.h>

auto get_environment_variable(std::string variable)
{
    const char *value = std::getenv(variable.c_str());
    return value == NULL ? std::nullopt : std::optional<std::string> { value };
}

auto darwin() -> int
{
    std::cout << "darwin" << std::endl;

    std::optional<std::string> subsys { get_environment_variable("LOGGER_SUBSYSTEM") };
    if (not subsys or subsys == "")
    {
        subsys = "com.razorrock.logger";
    }

    std::cout << "Subsystem: " << *subsys << std::endl;

    return 0;

    auto subsystem = "com.razorrock.logger";
    auto category = "testing";

    auto log = os_log_create(subsys.value().c_str(), category);

    os_log(log, "This is a debug message!!");
    os_log_with_type(log, OS_LOG_TYPE_DEFAULT, "This is a debug message.");
    os_log_with_type(log, OS_LOG_TYPE_ERROR, "This is a error message.");

    return 0;
}
