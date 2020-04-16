Python bindings for the fabulous `libwkhtmltox` using Cython

Special thanks to antialize for creating [wkhtmltopdf](http://wkhtmltopdf.org)

For parameters and settings (for users familiar with the command line utility) see:

    http://wkhtmltopdf.org/libwkhtmltox/pagesettings.html

### Installation

    $ python setup.py install

Tested on:

 * Mac OSX 10.6.4 Snow Leopard, Python 2.6.1 (32-bit and 64-bit)
 * CentOS 5.5, Python 2.6.4 (32-bit)
 * Windows 7, Python 2.7.6 (32-bit)

### Pre-requisites on all platforms:

 * you need `libwkhtmltox.*` somewhere in your LD path (`/usr/local/lib`)
 * you need the directory `include/wkhtmltox` from `wkhtmltopdf` somewhere on your include path (`/usr/local/include`)

### OSX Notes
If compiling for OSX (64-bit Python/libwkhtmltox only), until [this bug](http://bugreports.qt-project.org/browse/QTBUG-5952) is fixed you need the `qt_menu.nib` directory from the QT source tree in the same directory as your `libwkhtmltox.*` library files.

### Windows Notes

You will need Visual Studio 2008 ([VS2008 Express](http://go.microsoft.com/?linkid=7729279)
with [SP1](http://www.microsoft.com/en-us/download/details.aspx?id=10986) and latest updates
from Microsoft Update should work as well). Start a "Visual Studio 2008 Command Prompt" and
run the following (assuming that `wkhmltopdf` is installed in `C:\Program Files\wkhtmltopdf`:

    set INCLUDE=%INCLUDE%C:\Program Files\wkhtmltopdf\include;
    set LIB=%LIB%C:\Program Files\wkhtmltopdf\lib;
    python setup.py bdist_wininst

This would produce an installer in the `dist/` folder which you can install. You will need to
have `C:\Program Files\wkhtmltopdf\bin` in the path or copy `wkhtmltox.dll` along with the
extension.

### Cython
If you want to re-generate C source (or have made changes to the Cython template file, .pyx) you need Cython (tested with 0.13):

    $ easy_install cython

### Docker

    $ docker build -f Dockerfile --target "dev" -t "py-wkhtmltox:dev" .
    $ docker run -it -v $PWD/:/code/ --name pywk_dev py-wkhtmltox:dev bash
    $ docker start pywk_dev
    $ docker container exec -it pywk_dev bash
