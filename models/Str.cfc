component {

    function snake( str ) {
        return arrayToList( arrayMap( words( str ), function( w ) {
            return lCase( w );
        } ), "_" );
    }

    function kebab( str ) {
        return arrayToList( arrayMap( words( str ), function( w ) {
            return lCase( w );
        } ), "-" );
    }

    function studly( str ) {
        return arrayToList( arrayMap( words( str ), function( w ) {
            return capitalize( w );
        } ), "" );
    }

    function camel( str ) {
        return lowercase( studly( str ) );
    }

    function capitalizeWords( str ) {
        return arrayToList( arrayMap( listToArray( str, " " ), function( s ) {
            return capitalize( lcase( s ) );
        } ), " " );
    }

    function capitalize( str ) {
        var strArray = listToArray( str, "" );
        strArray[ 1 ] = uCase( strArray[ 1 ] );
        return arrayToList( strArray, "" );
    }

    function lowercaseWords( str ) {
        return arrayToList( arrayMap( listToArray( str, " " ), function( s ) {
            return lowercase( lcase( s ) );
        } ), " " );
    }

    function lowercase( str ) {
        var strArray = listToArray( str, "" );
        strArray[ 1 ] = lCase( strArray[ 1 ] );
        return arrayToList( strArray, "" );
    }

    function words( str ) {
        return listToArray(
            REReplace( addSpaceBetweenCapitalLetters( str ), "[\_\-]", " ", "ALL" ),
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

        return newString &= mid( str, start, len( str ) );;
    }

}