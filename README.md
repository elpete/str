# str

[![Master Branch Build Status](https://img.shields.io/travis/elpete/str/master.svg?style=flat-square&label=master)](https://travis-ci.org/elpete/str)

## A collection of string helper functions

### Methods

#### `plural`

Pluralizes a word. Takes an optional count.

```
str.plural( "entity" );

// "entities"

str.plural( "tree", 1 );

// "tree"
```

#### `slice`

Takes a subset of a word from `begin` to `end`.  If `end` is not provided, it will slice to the end of the word.

```
str.slice( "competent", 2, 4 );

// "omp"

str.slice( "competent", 2 );

// "ompetent"
```

#### `startsWith`

Returns whether a word starts with a given substring.

```
str.startsWith( "getDynamicMethod", "get" );

// true

str.startsWith( "setDynamicMethod", "get" );

// false
```

#### `slug`

Converts a string to a lowercased slug-delimited string with a given delimiter.
Can take the character to use as the delimiter as the second argument. (Default: `-``)

```
str.slug( "My Post Title" );

// "my-post-title"

str.slug( "Another Post", "_" );

// "another_post"
```

#### `snake`

Converts a string to snake case.

```
str.snake( "Another Post" );

// "another_post"
```

#### `kebab`

Converts a string to kebab case.

```
str.kebab( "My Post Title" );

// "my-post-title"
```

#### `studly`

Converts a string to studly case.

```
str.studly( "My Post Title" );

// "MyPostTitle"
```

#### `camel`

Converts a string to camel case.

```
str.camel( "My Post Title" );

// "myPostTitle"
```

#### `capitalizeWords`

Capitalizes each word in a string.

```
str.capitalizeWords( "my post title" );

// "My Post Title"
```

#### `capitalize`

Capitalizes the beginning of the string.
It takes an optional second parameter to preserve the casing of other words in the sentence.
It defaults to `false` which means all other letters besides the first one will be lowercased.

```
str.capitalize( "my post title" );

// "My post title"

str.capitalize( str = "my pOsT tiTLe" );

// "My post title"

str.capitalize( str = "my pOsT tiTLe", preserveCase = true );

// "My pOsT tiTLe"
```

#### `lowercaseWords`

Capitalizes each word in a string.

```
str.lowercaseWords( "my post title" );

// "my post title"
```

#### `lowercase`

Capitalizes the beginning of the string.
It takes an optional second parameter to preserve the casing of other words in the sentence.
It defaults to `false` which means all other letters besides the first one will be lowercased.

```
str.lowercase( "My post title" );

// "my post title"

str.lowercase( str = "My pOsT tiTLe" );

// "my post title"

str.lowercase( str = "My pOsT tiTLe", preserveCase = true );

// "my pOsT tiTLe"
```

#### `limit`

Truncates the string at the specified limit and appends an ending character sequence.
If the string is not longer than the limit, the entire string is returned unmodified.
The ending character sequence can be passed in as the third argument. (Default: `...`)

```
str.limit( "A short string", 20 );

// "A short string"

str.limit( "A really long sentence that I want to cut off", 20 );

// "A really long senten..."

str.limit( "A really long sentence that I want to cut off", 20, "---" );

// "A really long senten---"
```

#### `limitWords`

Truncates the string at the specified number of words and appends an ending character sequence.
If the number of words in the string is not longer than the limit, the entire string is returned unmodified.
The ending character sequence can be passed in as the third argument. (Default: `...`)

```
str.limitWords( "A short string", 4 );

// "A short string"

str.limitWords( "A really long sentence that I want to cut off", 4 );

// "A really long sentence..."

str.limitWords( "A really long sentence that I want to cut off", 4, "---" );

// "A really long sentence---"
```

#### `words`

Splits a string into words and returns the words as an array.
Splits on capital letters, underscores, and dashes.

```
str.words( "myCamelCaseString" );

// [ "my", "Camel", "Case", "String" ]

str.words( "MyMixed-caseString" );

// [ "My", "Mixed", "case", "String" ]
```
