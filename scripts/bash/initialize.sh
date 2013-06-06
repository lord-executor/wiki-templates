#!/bin/bash

TEMPLATE=${1:-default}

git init
git submodule add -b tools git@github.com:lord-executor/wiki-templates.git tools/
git submodule add -b default git@github.com:lord-executor/wiki-templates.git template/

cat > webroot.xml <<EOL
<?xml version="1.0" encoding="utf-8" ?>
<server port="8888">
	<preHook type="MiniHttp.RequestHooks.IndexRouting" />
	<route expression=".*" type="MiniHttp.Plugins.RequestHandlers.MarkdownHandler, MiniHttp.Plugins" />
	<route expression=".*" type="MiniHttp.RequestHandlers.StaticFileHandler" />
	<route expression=".*" type="MiniHttp.RequestHandlers.DirectoryListingHandler" />
	<route expression=".*" type="MiniHttp.RequestHandlers.NotFoundHandler" />
	<postHook type="MiniHttp.RequestHooks.ServerError" />
</server>
EOL

cat > _template.html <<EOL
@template("template/template.html")
@content()
EOL

cat > index.md <<EOL
# Home
Hello World
EOL

git add --all

echo
echo "All done. You can make the initial commit now."
