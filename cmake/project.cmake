cmake_minimum_required(VERSION 3.18)

project(
    logger
    VERSION 1.0.0
    DESCRIPTION "Capture telemetry from your app for debugging and performance analysis"
    HOMEPAGE_URL https://github.com/marksisson/logger
    LANGUAGES CXX OBJCXX
)

add_executable(logger)

target_sources(logger PRIVATE
    main.cc
    posix.cc
    posix.hh
    darwin.mm
)

target_compile_features(logger PRIVATE cxx_std_17)
