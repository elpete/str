component extends="testbox.system.BaseSpec" {

    function beforeAll() {
        var javaloaderStub = createStub().$(
            "create",
            createObject( "java", "org.atteo.evo.inflector.English" )
        );
        variables.str = new root.models.Str( javaloaderStub );
    }

    function run() {
        describe( "str", function() {
            it( "can be instantiated", function() {
                expect( str ).toBeInstanceOf( "root.models.Str" );
            } );

            describe( "limit", function() {
                describe( "limitWords", function() {
                    it( "can limit a string to a certain number of words", function() {
                        expect( str.limitWords( "Eric Peterson", 1 ) ).toBeWithCase( "Eric..." );
                    } );

                    it( "can specify a custom ending", function() {
                        expect( str.limitWords( "Eric Peterson", 1, "___" ) ).toBeWithCase( "Eric___" );
                    } );

                    it( "returns the full value if it has less words than the limit", function() {
                        expect( str.limitWords( "Eric Peterson", 3 ) ).toBeWithCase( "Eric Peterson" );
                    } );
                } );

                describe( "limit", function() {
                    it( "can limit a string to a certain number of characters", function() {
                        expect( str.limit( "Eric Peterson", 7 ) ).toBeWithCase( "Eric Pe..." );
                    } );

                    it( "can specify a custom delimiter", function() {
                        expect( str.limit( "Eric Peterson", 6, "___" ) ).toBeWithCase( "Eric P___" );
                    } );

                    it( "returns the full value if it has less words than the limit", function() {
                        expect( str.limit( "Eric Peterson", 20 ) ).toBeWithCase( "Eric Peterson" );
                    } );
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

            describe( "plural", function() {
                it( "can determine the plural of most words", function() {
                    expect( str.plural( "word" ) ).toBe( "words" );
                    expect( str.plural( "glass" ) ).toBe( "glasses" );
                } );

                it( "accepts a count to return the correct pluralization", function() {
                    expect( str.plural( "word", 0 ) ).toBe( "words" );
                    expect( str.plural( "word", 1 ) ).toBe( "word" );
                    expect( str.plural( "word", 2 ) ).toBe( "words" );
                } );
            } );

            describe( "slice", function() {
                it( "can slice from a beginning to an end index", function() {
                    expect( str.slice( "hello", 2, 4 ) ).toBe( "ell" );
                } );

                it( "slices to the end of a string if no end index is provided", function() {
                    expect( str.slice( "hello", 2 ) ).toBe( "ello" );
                } );
            } );

            describe( "startsWith", function() {
                it( "returns true if a string starts with the substring provided", function() {
                    expect( str.startsWith( "hello", "hel" ) ).toBeTrue();
                    expect( str.startsWith( "hello", "hal" ) ).toBeFalse();
                } );
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

                describe( "slug", function() {
                    it( "it separates capital letters", function() {
                        expect( str.slug( "ColdboxCfmlFramework" ) ).toBeWithCase( "coldbox-cfml-framework" );
                    } );

                    it( "separates capital letters in a row", function() {
                        expect( str.slug( "ColdBoxCFMLFramework" ) ).toBeWithCase( "cold-box-c-f-m-l-framework" );
                    } );

                    it( "separates spaces", function() {
                        expect( str.slug( "Coldbox Cfml Framework" ) ).toBeWithCase( "coldbox-cfml-framework" );
                    } );

                    it( "accepts a custom delimiter", function() {
                        expect( str.slug( "Coldbox Cfml Framework", "_" ) ).toBeWithCase( "coldbox_cfml_framework" );
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
                        expect( str.capitalize( "first letter Of a sTrinG" ) ).toBeWithCase( "First letter of a string" );
                    } );

                    it( "can leave the rest of the string in the original case", function() {
                        expect( str.capitalize( str = "first letter Of a sTrinG", preserveCase = true ) )
                            .toBeWithCase( "First letter Of a sTrinG" );
                    } );

                    it( "capitalizes the first letter of the string ignoring non letter characters", function() {
                        expect( str.capitalize( "(first)" ) ).toBeWithCase( "(First)" );
                    } );
                } );

                describe( "lowercaseWords", function() {
                    it( "lowercases every word of a sentance", function() {
                        expect( str.lowercaseWords( "every word Of a senTanCe" ) ).toBeWithCase( "every word of a sentance" );
                    } );
                } );

                describe( "lowercase", function() {
                    it( "lowercases the first letter of the string", function() {
                        expect( str.lowercase( "First letter Of a sTrinG" ) ).toBeWithCase( "first letter of a string" );
                    } );

                    it( "can leave the rest of the string in the original case", function() {
                        expect( str.lowercase( str = "First letter Of a sTrinG", preserveCase = true ) )
                            .toBeWithCase( "first letter Of a sTrinG" );
                    } );
                } );
            } );
        } );
    }

}
