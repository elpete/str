component {
    
    this.name = "str";
    this.author = "Eric Peterson";
    this.webUrl = "https://github.com/elpete/str";
    this.dependencies = [ "cbjavaloader" ];

    function configure() {
        //
    }

    function onLoad() {
        controller.getWireBox().getInstance( "loader@cbjavaloader" )
            .appendPaths( modulePath & "/lib" );
    }
}