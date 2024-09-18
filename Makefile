.PHONY: compile compile_json

compile:
	ghc -outputdir ./build -o ./bin/hello hello.hs
	ghc -outputdir ./build -o ./bin/wc wc.hs
	ghc -outputdir ./build --make interact_with.hs -o ./bin/interact_with

compile_json:
	ghc -outputdir ./build \
	--make json/Jason.hs \
	--make json/PutJSON.hs \
	--make json/Prettify.hs \
	--make json/PrettyJSON.hs \
	--make json/Main.hs -o ./bin/json