# cli-image

[![cli-image Build Status](https://travis-ci.org/prikhi/cli-image.svg?branch=master)](https://travis-ci.org/prikhi/cli-image)


Show high-res images in the terminal. Requires `w3mimgdisplay`.

Pass optional arguments for scaling & positioning.

```sh
stack install
export PATH="~/.local/bin/:${PATH}"
cli-image <image-path> [WIDTH [HEIGHT [X [Y]]
```

Press `Enter` to exit.


## Build

You can build the project with stack:

```sh
stack build
```

For development, you can enable fast builds with file-watching,
documentation-building, & test-running:

```sh
stack test --haddock --fast --file-watch --pedantic
```

To build & open the documentation, run

```sh
stack haddock --open cli-image
```


## LICENSE

BSD-3
