component {

    this.name = "str";
    this.author = "Eric Peterson";
    this.webUrl = "https://github.com/elpete/str";
    this.dependencies = [ "cbjavaloader" ];

    function configure() {
        //
    }

    function onLoad() {
        wirebox.getInstance( "loader@cbjavaloader" )
            .appendPaths( modulePath & "/lib" );
    }
}
