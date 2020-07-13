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
        return arrayToList( map( words( str ), function( w ) {
            return lCase( w );
        } ), delimiter );
    }

    function snake( str ) {
        return slug( str, "_" );
    }

    function kebab( str ) {
        return slug( str, "-" );
    }

    function studly( str ) {
        return arrayToList( map( words( str ), function( w ) {
            return capitalizeWords( w );
        } ), "" );
    }

    function camel( str ) {
        return lowercase( str = studly( str ), preserveCase = true );
    }

    function capitalizeWords( str ) {
        return arrayToList( map( listToArray( str, " " ), capitalize ), " " );
    }

    function capitalize( str, preserveCase = false ) {
        var strArray = listToArray( preserveCase ? str : lcase( str ), "" );
        var firstCharacterIndex = reFind( "\w", arguments.str );
        strArray[ firstCharacterIndex ] = uCase( strArray[ firstCharacterIndex ] );
        return arrayToList( strArray, "" );
    }

    function lowercaseWords( str ) {
        return arrayToList( map( listToArray( str, " " ), function( s ) {
            return lowercase( lcase( s ) );
        } ), " " );
    }

    function lowercase( str, preserveCase = false ) {
        var strArray = listToArray( preserveCase ? str : lcase( str ), "" );
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
        return listToArray(
            addSpaceBetweenCapitalLetters(
                REReplace( str , "[\_\-]", " ", "ALL" )
            ),
            " "
        );
    }

    private function addSpaceBetweenCapitalLetters( str ) {
        var pattern = createObject( "java", "java.util.regex.Pattern" );
        var matches = pattern.compile( "[A-Z]" ).matcher( str );
        var newString = "";
        var start = 0;
        while( matches.find() ) {
            if ( start == 0 ) {
                start = matches.start() + 1;
                continue;
            }
            newString &= mid( str, start, matches.start() - start + 1 ) & " ";
            start = matches.start() + 1;
        }

        if ( newString == "" ) {
            return str;
        }

        return newString & mid( str, start, len( str ) );
    }

    private function map( arr, callback ) {
        var newArr = [];
        for ( var item in arr ) {
            arrayAppend( newArr, callback( item ) );
        }
        return newArr;
    }

}
