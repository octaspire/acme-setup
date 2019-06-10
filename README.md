# Octaspire's Acme Setup

Scripts to be used with the [Acme editor](http://acme.cat-v.org); mainly
when using [Plan 9 from User Space](https://9fans.github.io/plan9port/).
Contains:

* __octaspire_acme__: Run this command instead of `acme` to make sure
   that plumber and fontsrv are running before Acme is started. Will start
   Acme with some specific settings and font. Will also load `acme.dump`
   if available (this restores the workspace and gives also functionality
   similar to 'Goto Last Change' in GNU/Emacs).

* __octaspire_tags_up__: Takes care of creating and updating TAGS (universal-ctags) files
   so that the user never has to do it. Detects changes currently using modification
   time of files; more robust solution would be checksumming the files.

* __octaspire_tags_find__: Locates definition of the highlighted name and reports
  it as filename:linenum pair, so that the file and correct line can be easily jumped to
  using the third mouse button.

* __octaspire_tags_complete__: Lists completion suggestions for the highlighted
  (partial) name. Matches are looked for and sorted fuzzily using Levenshtein
  distances. *Philosophical Note: I think that code completion might encourage
  use of overlong names and thus it might be something that should not be done;
  instead the situation might be fixed by just using shorter names.* 

* __octaspire_tags_signature__: Reports function signature for the C function,
  that has its name highlighted.

## Requirements

UNIX like operating system, Plan 9 from User Space, universal ctags
and Python 3 with fuzzywuzzy package, that can be installed using:

```sh
pip install --user fuzzywuzzy[speedup]
```

To lint the scripts, `shellcheck` and `pylint` are also needed.
To proofread the `README.md` as HTML, `markdown_py` is required.

Acme is started with font `Inconsolata-Regular`, and thus that font should
be available on the system (otherwise another font should be selected in
the `octaspire_acme`-script).

## Usage

Copy executables into a directory that is on your path. If `$HOME/bin` is on
your path, you can copy files like this:

```sh
make install
```

Then Acme can be started using:

```sh
octaspire_acme
```

Other commands can be run by writing and selecting them from the tag:

```
> octaspire_tags_find  > octaspire_tags_complete  > octaspire_tags_signature
```

## License

Apache License, Version 2.0
