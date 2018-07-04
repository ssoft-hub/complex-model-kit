TEMPLATE = subdirs

CONFIG *= ordered

SUBDIRS *= \
    $${PWD}/.qmake.qt4.pro \
    $${PWD}/.qmake.cache.pro \

SUBDIRS *= \
    $${PWD}/project/qmake/library.pro \
    $${PWD}/project/qmake/example.pro \
    $${PWD}/project/qmake/test.pro \

OTHER_FILES *= \
    $${PWD}/.qmake.conf \
    $$files( $${PWD}/project/qmake/features/*.prf ) \
    $$files( $${PWD}/*.cache ) \
