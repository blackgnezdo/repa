{-# OPTIONS_HADDOCK hide #-}
{-# LANGUAGE BangPatterns #-}

module Data.Array.Repa.Operators.Select
	(select)
where
import Data.Array.Repa.Index
import Data.Array.Repa.Internals.Elt
import Data.Array.Repa.Internals.Base
import Data.Array.Repa.Internals.Select
import qualified Data.Vector.Unboxed		as V
import System.IO.Unsafe


-- | Select elements maching a given predicate.
--   Good for writing filtering operations on arrays.
--   TODO: Also make a version that takes a Shape instead of a flat index.
select	:: Elt a
	=> (Int -> Bool)	-- ^ If the Int matches this predicate, 
	-> (Int -> a)		-- ^  ... then pass it to this fn to produce a value
	-> Int			-- ^ Range between 0 and this maximum.
	-> Array DIM1 a		-- ^ Array containing produced values.
	
{-# INLINE select #-}
select match produce len
 = unsafePerformIO 
 $ do	(sh, vec)	<- selectIO 
	return $ sh `seq` vec `seq` 
		 Array sh [Region RangeAll (GenManifest vec)]
		
 where	{-# INLINE selectIO #-}
	selectIO
 	 = do	vecs		<- selectChunkedP match produce len
		vecs'		<- mapM V.unsafeFreeze vecs

		-- TODO: avoid copy.
		let result	= V.concat vecs'
		
		return	(Z :. V.length result, result)
		
