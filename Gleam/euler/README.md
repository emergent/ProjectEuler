# euler

Project Euler solutions written in Gleam.

This repository predates the current Gleam toolchain. The code has been cleaned
up so it no longer depends on the external maths package, and the dependency
set is pinned to a combination that builds with the locally installed
`gleam 1.12.0`.

## Development

```sh
gleam run          # Show the entrypoint help
gleam run -m p001  # Run problem 1
gleam run -m p024  # Run problem 24
gleam test         # Run the tests
```

## Notes

- On this machine, newer package releases pulled in by `gleam update` required
  a newer Gleam compiler than `1.12.0`, so they were not adopted here.
- If you upgrade the `gleam` binary itself, the next step is to run
  `gleam update` again and revisit the stdlib / test dependency versions.
