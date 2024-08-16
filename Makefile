compile:
	ghc -outputdir ./build -o ./bin/hello hello.hs
	ghc -outputdir ./build -o ./bin/wc wc.hs