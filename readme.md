# Gallery-DL Container
An image of the ubuntu filesystem with gallery-dl installed and ready to use in the command line.

## Volume
You will need to use a volume to make proper use of this image, linking it to `/home/container` inside of the container created from the image. The folder linked should have the following:

`./config` - A folder containing a `gallery-dl.conf` file.

`./gallery-dl` - The folder downloads will go into. (Could be different based on your `gallery-dl.conf` file)

`create_cbz.sh` - A bash script used by the `create_cbz` command to make .cbz filed from your downloaded galleries.

`if.txt` - An input file to put a list of links in (separated by line) that will be downloaded when using the `download_galleries` command.


## Aliases
There are two command that have been added as aliases to make downloading easier:

`download_galleries` - Downloads all links listed in the `if.txt` file

`create_cbz` - Creates .cbz files for every downloaded archive in the `./gallery-dl` directory. (Note: the .cbz files will be create INSIDE OF THE DIRECTORY THIS COMMNAND IS RUN FROM).