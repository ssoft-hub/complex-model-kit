# Тип проекта
TEMPLATE = subdirs

# Исправление багов qmake Qt4.
isEqual( QT_MAJOR_VERSION, 4 ) {
    # Копирование фитчей в папку, где qmake Qt4 их найдет
    QT5_FEATURES_PATH = $${PWD}/project/qmake/features
    QT4_FEATURES_PATH = $${OUT_PWD}/features

    win* {
        MAKE_FEATURES_COMMAND = mkdir \"$${QT4_FEATURES_PATH}\"
        COPY_FEATURES_COMMAND = copy /Y \"$${QT5_FEATURES_PATH}\" \"$${QT4_FEATURES_PATH}\"
        COPY_CONFIG_COMMAND = copy /Y \"$${PWD}\\.qmake.conf\" \"$${OUT_PWD}\\.qmake.cache\"
    }

    unix {
        MAKE_FEATURES_COMMAND = mkdir \'$${QT4_FEATURES_PATH}\'
        COPY_FEATURES_COMMAND = find \'$${QT5_FEATURES_PATH}/\' -iname \'*.prf\' -exec cp \'-f\' \'{}\' \'$${QT4_FEATURES_PATH}/\' \';\'
        COPY_CONFIG_COMMAND = cp \'-f\' \'$${PWD}/.qmake.conf\' \'$${OUT_PWD}/.qmake.cache\'
    }

    !exists( $${QT4_FEATURES_PATH} ) {
        message( [$$basename( _PRO_FILE_ )]: Make features path: $${MAKE_FEATURES_COMMAND} )
        !system( $${MAKE_FEATURES_COMMAND} ): \
            error( [$$basename( _PRO_FILE_ )]: Can not make features path )
    } else {
        message( [$$basename( _PRO_FILE_ )]: Find features path: $${QT4_FEATURES_PATH} )
    }

    message( [$$basename( _PRO_FILE_ )]: Copy configuration: $${COPY_CONFIG_COMMAND} )
    !system( $${COPY_CONFIG_COMMAND} ): \
        error( Can not copy configuration )

    message( [$$basename( _PRO_FILE_ )]: Copy features: $${COPY_FEATURES_COMMAND} )
    !system( $${COPY_FEATURES_COMMAND} ): \
        error( Can not copy features )
}
