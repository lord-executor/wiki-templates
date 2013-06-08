
$template = $Args[0]
if (!$template) {
	$template = "default"
}

git init
git submodule add -b tools git@github.com:lord-executor/wiki-templates.git tools/
git submodule add -b default git@github.com:lord-executor/wiki-templates.git template/

Write-Output @"
<?xml version="1.0" encoding="utf-8" ?>
<server port="8888">$variable
	<preHook type="MiniHttp.RequestHooks.IndexRouting" />
	<route expression=".*" type="MiniHttp.Plugins.RequestHandlers.MarkdownHandler, MiniHttp.Plugins" />
	<route expression=".*" type="MiniHttp.RequestHandlers.StaticFileHandler" />
	<route expression=".*" type="MiniHttp.RequestHandlers.DirectoryListingHandler" />
	<route expression=".*" type="MiniHttp.RequestHandlers.NotFoundHandler" />
	<postHook type="MiniHttp.RequestHooks.ServerError" />
</server>
"@ > webroot.xml

Write-Output @"
@template("template/template.html")
@content()
"@ > _template.html

Write-Output @"
# Home
Hello World
"@ > index.md

git add --all

Write-Output ""
Write-Output "All done. You can make the initial commit now."