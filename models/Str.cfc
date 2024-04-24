component singleton {

    /**
     * @javaloader The JavaLoader class
     * @javaloader.inject loader@cbjavaloader
     */
    function init( required javaloader ) {
        variables.pluralizer = javaloader.create( "org.atteo.evo.inflector.English" ).init();
        return this;
    }

    function plural( word, count = 0 ) {
        return pluralizer.plural( word, count );
    }

    function slice( word, begin, end ) {
        if ( isNull( arguments.end ) ) {
            arguments.end = len( word );
        }
        return mid( word, begin, end + 1 - begin );
    }

    function startsWith( word, substring ) {
        return left( word, len( substring ) ) == substring;
    }

    function slug( str, delimiter = "-" ) {
        return arrayToList(
            map( words( str ), function( w ) {
                return lCase( w );
            } ),
            delimiter
        );
    }

    function snake( str ) {
        return slug( str, "_" );
    }

    function kebab( str ) {
        return slug( str, "-" );
    }

    function studly( str ) {
        return arrayToList(
            map( words( str ), function( w ) {
                return capitalizeWords( w );
            } ),
            ""
        );
    }

    function camel( str ) {
        return lowercase( str = studly( str ), preserveCase = true );
    }

    function capitalizeWords( str ) {
        return arrayToList( map( listToArray( str, " " ), capitalize ), " " );
    }

    function capitalize( str, preserveCase = false ) {
        var strArray = listToArray( preserveCase ? str : lCase( str ), "" );
        var firstCharacterIndex = reFind( "\w", arguments.str );

        if ( firstCharacterIndex == 0 ) {
            return str;
        }

        strArray[ firstCharacterIndex ] = uCase( strArray[ firstCharacterIndex ] );
        return arrayToList( strArray, "" );
    }

    function lowercaseWords( str ) {
        return arrayToList(
            map( listToArray( str, " " ), function( s ) {
                return lowercase( lCase( s ) );
            } ),
            " "
        );
    }

    function lowercase( str, preserveCase = false ) {
        var strArray = listToArray( preserveCase ? str : lCase( str ), "" );
        strArray[ 1 ] = lCase( strArray[ 1 ] );
        return arrayToList( strArray, "" );
    }

    function limit( str, limit, end = "..." ) {
        if ( len( str ) <= limit ) {
            return str;
        }

        return left( str, limit ) & end;
    }

    function limitWords( str, limit, end = "..." ) {
        var ws = words( str );
        if ( arrayLen( ws ) <= limit ) {
            return str;
        }
        return arrayToList( arraySlice( ws, 1, limit ), " " ) & end;
    }

    function words( str ) {
        var split = listToArray( arguments.str, " " );
        if ( arrayLen( split ) > 1 ) {
            return split;
        }
        return listToArray( addSpaceBetweenCapitalLetters( reReplace( str, "[\_\-\.]", " ", "ALL" ) ), " " );
    }

    private function addSpaceBetweenCapitalLetters( str ) {
        return reReplace(
            arguments.str,
            "([A-Z])",
            " \1",
            "all"
        );
    }

    private function map( arr, callback ) {
        var newArr = [];
        for ( var item in arr ) {
            arrayAppend( newArr, callback( item ) );
        }
        return newArr;
    }

}
