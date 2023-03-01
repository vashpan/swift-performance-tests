# Swift Performance Tests

## General

A very simple and naive program for testing various aspects of Swift performance, related to lower and higher level implementations of various common tasks

You can treat it as-is, or as a base for your own tests and benchmarks for alternate implementations of the same algorithm.

Sorry for my lack of imagination or sophistication with those "benchmarks" ;)

Please note: this is **NOT** a benchmark, it's not designed as such so there's no point in bragging your results.

## Observations

1. Debug builds in Swift might be 100x times slower than release ones! This is true since the very beginning of Swift language. It seems that generating 10 mln items of fake data takes ~100 times slower on "debug" than on "release" version of the app, hence much smaller number of test items in debug mode.

2. Higher-order functions, like `filter`, `map`, `reduce` are as fast or sometimes even faster than loop-based imperative implementations. To be honest I was rather surprised, especially in situations with chaining - intuitively it shouldn't be as optimized as it is, but here we are. It would need a bit more of investigations, on assembly level but indeed it seems that compiler is smart enough to optimize such uses.

## Instructions

Just run it in release mode: `swift run -c release`.
