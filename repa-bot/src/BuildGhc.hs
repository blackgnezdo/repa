
-- | Build stages concerning GHC.
module BuildGhc
	( ghcUnpack
	, ghcBuild)
where
import BuildBox

ghcUnpack :: String -> String -> Build ()
ghcUnpack fileSnapShot dirScratch
 = inDir dirScratch
 $ do	
	outLn "* Cleaning house"
	clobberDir "ghc-head"
	
	outLn "* Unpacking GHC"

	outLn $ "  - Unpacking snapshot " ++ fileSnapShot
	ssystem $ "tar zxf " ++ fileSnapShot
	
	outLn $ "  - Updating snapshot"
	inDir "ghc-head"
	 $ ssystem "./darcs-all pull -av"
	

ghcBuild :: String -> Build ()
ghcBuild dirScratch
 = inDir dirScratch
 $ inDir "ghc-head"
 $ do	outLn "* Building GHC"
	
	ssystem "perl boot"
	ssystem "./configure"
	ssystem "make"
	 
	inDir "inplace/bin"
	 $ ssystem $ "ln -s ghc-stage2 ghc"
	
	outBlank
	outBlank
