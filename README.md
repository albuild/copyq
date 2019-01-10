# albuild-copyq

Yet another unofficial [CopyQ] package for Amazon Linux 2.

## Install (Amazon WorkSpaces)

### System Requirements

### Instructions

1. Download the package from [the Release page](https://github.com/albuild/copyq/releases/tag/v0.1.0).

1. Install the package.

    ```
    sudo yum -y install albuild-copyq-0.1.0-0.amzn2.x86_64.rpm
    ```

## Build (Amazon WorkSpaces)

### System Requirements

* Docker

### Instructions

1. Clone this repository.

    ```
    git clone https://github.com/albuild/copyq.git
    ```

1. Go to the repository.

    ```
    cd copyq
    ```

1. Build a new image.

    ```
    bin/build
    ```

1. Extract the built package from the image. The package will be copied to the ./rpm directory.

    ```
    bin/cp
    ```

1. Delete the image.

    ```
    bin/rmi
    ```

[CopyQ]: https://github.com/hluk/CopyQ
