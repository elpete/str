component extends="testbox.system.BaseSpec" {
    function beforeAll() {
        variables.str = new root.models.Str();
    }
    function run() {
        describe( "str", function() {
            it( "can be instantiated", function() {
                expect( str ).toBeInstanceOf( "root.models.Str" );
            } );

            xdescribe( "truncate", function() {
                it( "can truncate a string to a certain number of words", function() {
                    expect( str.truncate( "Eric Peterson", 1 ) ).toBeWithCase( "Eric..." );
                } );

                it( "can specify a custom delimiter", function() {
                    expect( str.truncate( "Eric Peterson", 1, "___" ) ).toBeWithCase( "Eric___" );
                } );

                it( "returns the full value if it has less words than the limit", function() {
                    expect( str.truncate( "Eric Peterson", 3 ) ).toBeWithCase( "Eric Peterson" );
                } );
            } );

            describe( "words", function() {
                it( "splits based on spaces", function() {
                    expect( str.words( "You are awesome" ) ).toBe( [ "You", "are", "awesome" ] );
                } );

                it( "splits based on capital letters", function() {
                    expect( str.words( "ColdBoxIsAwesome" ) ).toBe( [ "Cold", "Box", "Is", "Awesome" ] );
                } );
            } );

            xdescribe( "slug", function() {
                
            } );

            describe( "string case conversion", function() {
                describe( "snake", function() {
                    it( "it separates capital letters", function() {
                        expect( str.snake( "ColdboxCfmlFramework" ) ).toBeWithCase( "coldbox_cfml_framework" );
                    } );

                    it( "separates capital letters in a row", function() {
                        expect( str.snake( "ColdBoxCFMLFramework" ) ).toBeWithCase( "cold_box_c_f_m_l_framework" );
                    } );

                    it( "separates spaces", function() {
                        expect( str.snake( "Coldbox Cfml Framework" ) ).toBeWithCase( "coldbox_cfml_framework" );
                    } );
                } );

                describe( "kebab", function() {
                    it( "it separates capital letters", function() {
                        expect( str.kebab( "ColdboxCfmlFramework" ) ).toBeWithCase( "coldbox-cfml-framework" );
                    } );

                    it( "separates capital letters in a row", function() {
                        expect( str.kebab( "ColdBoxCFMLFramework" ) ).toBeWithCase( "cold-box-c-f-m-l-framework" );
                    } );

                    it( "separates spaces", function() {
                        expect( str.kebab( "Coldbox Cfml Framework" ) ).toBeWithCase( "coldbox-cfml-framework" );
                    } );
                } );

                describe( "studly", function() {
                    it( "capitalizes after spaces", function() {
                        expect( str.studly( "Coldbox Cfml Framework" ) ).toBeWithCase( "ColdboxCfmlFramework" );
                    } );

                    it( "capitalizes after underscores", function() {
                        expect( str.studly( "coldbox_c_f_m_l_framework" ) ).toBeWithCase( "ColdboxCFMLFramework" );
                    } );

                    it( "capitalizes after multiple underscores", function() {
                        expect( str.studly( "coldbox__cfml___framework" ) ).toBeWithCase( "ColdboxCfmlFramework" );
                    } );

                    it( "capitalizes after dashes", function() {
                        expect( str.studly( "coldbox-cfml-framework" ) ).toBeWithCase( "ColdboxCfmlFramework" );
                    } );
                } );

                describe( "camel", function() {
                    it( "capitalizes after spaces", function() {
                        expect( str.camel( "Coldbox Cfml Framework" ) ).toBeWithCase( "coldboxCfmlFramework" );
                    } );  

                    it( "capitalizes after underscores", function() {
                        expect( str.camel( "coldbox_c_f_m_l_framework" ) ).toBeWithCase( "coldboxCFMLFramework" );
                    } );

                    it( "capitalizes after dashes", function() {
                        expect( str.camel( "coldbox-cfml-framework" ) ).toBeWithCase( "coldboxCfmlFramework" );
                    } );
                } );

                describe( "capitalizeWords", function() {
                    it( "capitalizes every word of a sentance", function() {
                        expect( str.capitalizeWords( "every word Of a senTanCe" ) ).toBeWithCase( "Every Word Of A Sentance" );
                    } );
                } );

                describe( "capitalize", function() {
                    it( "capitalizes the first letter of the string", function() {
                        expect( str.capitalize( "first letter Of a sTrinG" ) ).toBeWithCase( "First letter Of a sTrinG" );
                    } );
                } );

                describe( "lowercaseWords", function() {
                    it( "lowercases every word of a sentance", function() {
                        expect( str.lowercaseWords( "every word Of a senTanCe" ) ).toBeWithCase( "every word of a sentance" );
                    } );
                } );

                describe( "lowercase", function() {
                    it( "lowercases the first letter of the string", function() {
                        expect( str.lowercase( "First letter Of a sTrinG" ) ).toBeWithCase( "first letter Of a sTrinG" );
                    } );
                } );
            } );
        } );
    }
}