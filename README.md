load_test_modules
=====

Load all test modules when running tests

Build
-----

    $ rebar3 compile

Use
---

Add the plugin to your rebar config:

    {plugins, [
        { load_test_modules, ".*", {git, "git@host:user/load_test_modules.git", {tag, "0.1.0"}}}
    ]}.

Then just call your plugin directly in an existing application:


    $ rebar3 load_test_modules
    ===> Fetching load_test_modules
    ===> Compiling load_test_modules
    <Plugin Output>
