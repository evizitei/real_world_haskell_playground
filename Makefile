compile:
	ghc -outputdir ./build -o ./bin/hello hello.hs
	ghc -outputdir ./build -o ./bin/wc wc.hs
	ghc -outputdir ./build --make interact_with.hs -o ./bin/interact_with