{-# LANGUAGE UndecidableInstances #-}
module Data.Repa.Array.Material.Auto
        ( A             (..)
        , Name          (..)
        , Array         (..))
where
import Data.Repa.Array.Tuple                    as A
import Data.Repa.Array.Window                   as A
import Data.Repa.Array.Internals.Bulk           as A
import Data.Repa.Array.Internals.Target         as A
import Data.Repa.Array.Internals.Layout         as A
import Data.Repa.Array.Material.Boxed           as A
import Data.Repa.Array.Material.Unboxed         as A
import Data.Repa.Product                        as B
import Data.Int
import Control.Monad
#include "repa-array.h"

-- | Automatic layout of array elements in some reasonably efficient
--   representation. 
--
--   The implementation uses type families to chose unboxed representations
--   for all elements that can be unboxed. In particular, arrays of unboxed
--   tuples are represented as tuples of unboxed arrays.
--
data A  = Auto { autoLength :: Int }
        deriving (Show, Eq)


instance Layout A where
 data Name  A                   = A
 type Index A                   = Int
 name                           = A
 create A len                   = Auto len
 extent (Auto len)              = len
 toIndex   _ ix                 = ix
 fromIndex _ ix                 = ix
 {-# INLINE_ARRAY name      #-}
 {-# INLINE_ARRAY create    #-}
 {-# INLINE_ARRAY extent    #-}
 {-# INLINE_ARRAY toIndex   #-}
 {-# INLINE_ARRAY fromIndex #-}

deriving instance Eq   (Name A)
deriving instance Show (Name A)


----------------------------------------------------------------------------------------------- Int
instance Bulk A Int where
 data Array A Int               = AArray_Int !(Array U Int)
 layout (AArray_Int arr)        = Auto (A.length arr)
 index  (AArray_Int arr) ix     = A.index arr ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index  #-}

deriving instance Show (Array A Int)

instance Windowable A Int where
 window st len (AArray_Int arr) 
  = AArray_Int (window st len arr)
 {-# INLINE_ARRAY window #-}

instance Target A Int where
 data Buffer s A Int            
  = ABuffer_Int !(Buffer s U Int)

 unsafeNewBuffer (Auto len)     
  = liftM ABuffer_Int $ unsafeNewBuffer (Unboxed len)
 {-# INLINE_ARRAY unsafeNewBuffer #-}

 unsafeReadBuffer   (ABuffer_Int arr) ix
  = unsafeReadBuffer arr ix
 {-# INLINE_ARRAY unsafeReadBuffer #-}

 unsafeWriteBuffer  (ABuffer_Int arr) ix x
  = unsafeWriteBuffer arr ix x
 {-# INLINE_ARRAY unsafeWriteBuffer #-}

 unsafeGrowBuffer   (ABuffer_Int arr) bump
  = liftM ABuffer_Int $ unsafeGrowBuffer arr bump
 {-# INLINE_ARRAY unsafeGrowBuffer #-}

 unsafeFreezeBuffer (ABuffer_Int arr)
  = liftM AArray_Int  $ unsafeFreezeBuffer arr 
 {-# INLINE_ARRAY unsafeFreezeBuffer #-}

 unsafeThawBuffer   (AArray_Int arr)
  = liftM ABuffer_Int $ unsafeThawBuffer  arr
 {-# INLINE_ARRAY unsafeThawBuffer #-}

 unsafeSliceBuffer st len (ABuffer_Int buf)
  = liftM ABuffer_Int $ unsafeSliceBuffer st len buf
 {-# INLINE_ARRAY unsafeSliceBuffer #-}

 touchBuffer (ABuffer_Int buf)
  = touchBuffer buf
 {-# INLINE_ARRAY touchBuffer #-}

 bufferLayout (ABuffer_Int buf)
  = Auto $ A.extent $ bufferLayout buf
 {-# INLINE_ARRAY bufferLayout #-}


--------------------------------------------------------------------------------------------- Int8
instance Bulk A Int8 where
 data Array A Int8               = AArray_Int8 !(Array U Int8)
 layout (AArray_Int8 arr)        = Auto (A.length arr)
 index  (AArray_Int8 arr) ix     = A.index arr ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index  #-}

deriving instance Show (Array A Int8)

instance Windowable A Int8 where
 window st len (AArray_Int8 arr) 
  = AArray_Int8 (window st len arr)
 {-# INLINE_ARRAY window #-}

instance Target A Int8 where
 data Buffer s A Int8            
  = ABuffer_Int8 !(Buffer s U Int8)

 unsafeNewBuffer (Auto len)     
  = liftM ABuffer_Int8 $ unsafeNewBuffer (Unboxed len)
 {-# INLINE_ARRAY unsafeNewBuffer #-}

 unsafeReadBuffer   (ABuffer_Int8 arr) ix
  = unsafeReadBuffer arr ix
 {-# INLINE_ARRAY unsafeReadBuffer #-}

 unsafeWriteBuffer  (ABuffer_Int8 arr) ix x
  = unsafeWriteBuffer arr ix x
 {-# INLINE_ARRAY unsafeWriteBuffer #-}

 unsafeGrowBuffer   (ABuffer_Int8 arr) bump
  = liftM ABuffer_Int8 $ unsafeGrowBuffer arr bump
 {-# INLINE_ARRAY unsafeGrowBuffer #-}

 unsafeFreezeBuffer (ABuffer_Int8 arr)
  = liftM AArray_Int8  $ unsafeFreezeBuffer arr 
 {-# INLINE_ARRAY unsafeFreezeBuffer #-}

 unsafeThawBuffer   (AArray_Int8 arr)
  = liftM ABuffer_Int8 $ unsafeThawBuffer  arr
 {-# INLINE_ARRAY unsafeThawBuffer #-}

 unsafeSliceBuffer st len (ABuffer_Int8 buf)
  = liftM ABuffer_Int8 $ unsafeSliceBuffer st len buf
 {-# INLINE_ARRAY unsafeSliceBuffer #-}

 touchBuffer (ABuffer_Int8 buf)
  = touchBuffer buf
 {-# INLINE_ARRAY touchBuffer #-}

 bufferLayout (ABuffer_Int8 buf)
  = Auto $ A.extent $ bufferLayout buf
 {-# INLINE_ARRAY bufferLayout #-}


--------------------------------------------------------------------------------------------- Int16
instance Bulk A Int16 where
 data Array A Int16               = AArray_Int16 !(Array U Int16)
 layout (AArray_Int16 arr)        = Auto (A.length arr)
 index  (AArray_Int16 arr) ix     = A.index arr ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index  #-}

deriving instance Show (Array A Int16)

instance Windowable A Int16 where
 window st len (AArray_Int16 arr) 
  = AArray_Int16 (window st len arr)
 {-# INLINE_ARRAY window #-}

instance Target A Int16 where
 data Buffer s A Int16            
  = ABuffer_Int16 !(Buffer s U Int16)

 unsafeNewBuffer (Auto len)     
  = liftM ABuffer_Int16 $ unsafeNewBuffer (Unboxed len)
 {-# INLINE_ARRAY unsafeNewBuffer #-}

 unsafeReadBuffer   (ABuffer_Int16 arr) ix
  = unsafeReadBuffer arr ix
 {-# INLINE_ARRAY unsafeReadBuffer #-}

 unsafeWriteBuffer  (ABuffer_Int16 arr) ix x
  = unsafeWriteBuffer arr ix x
 {-# INLINE_ARRAY unsafeWriteBuffer #-}

 unsafeGrowBuffer   (ABuffer_Int16 arr) bump
  = liftM ABuffer_Int16 $ unsafeGrowBuffer arr bump
 {-# INLINE_ARRAY unsafeGrowBuffer #-}

 unsafeFreezeBuffer (ABuffer_Int16 arr)
  = liftM AArray_Int16  $ unsafeFreezeBuffer arr 
 {-# INLINE_ARRAY unsafeFreezeBuffer #-}

 unsafeThawBuffer   (AArray_Int16 arr)
  = liftM ABuffer_Int16 $ unsafeThawBuffer  arr
 {-# INLINE_ARRAY unsafeThawBuffer #-}

 unsafeSliceBuffer st len (ABuffer_Int16 buf)
  = liftM ABuffer_Int16 $ unsafeSliceBuffer st len buf
 {-# INLINE_ARRAY unsafeSliceBuffer #-}

 touchBuffer (ABuffer_Int16 buf)
  = touchBuffer buf
 {-# INLINE_ARRAY touchBuffer #-}

 bufferLayout (ABuffer_Int16 buf)
  = Auto $ A.extent $ bufferLayout buf
 {-# INLINE_ARRAY bufferLayout #-}


--------------------------------------------------------------------------------------------- Int32
instance Bulk A Int32 where
 data Array A Int32               = AArray_Int32 !(Array U Int32)
 layout (AArray_Int32 arr)        = Auto (A.length arr)
 index  (AArray_Int32 arr) ix     = A.index arr ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index  #-}

deriving instance Show (Array A Int32)

instance Windowable A Int32 where
 window st len (AArray_Int32 arr) 
  = AArray_Int32 (window st len arr)
 {-# INLINE_ARRAY window #-}

instance Target A Int32 where
 data Buffer s A Int32            
  = ABuffer_Int32 !(Buffer s U Int32)

 unsafeNewBuffer (Auto len)     
  = liftM ABuffer_Int32 $ unsafeNewBuffer (Unboxed len)
 {-# INLINE_ARRAY unsafeNewBuffer #-}

 unsafeReadBuffer   (ABuffer_Int32 arr) ix
  = unsafeReadBuffer arr ix
 {-# INLINE_ARRAY unsafeReadBuffer #-}

 unsafeWriteBuffer  (ABuffer_Int32 arr) ix x
  = unsafeWriteBuffer arr ix x
 {-# INLINE_ARRAY unsafeWriteBuffer #-}

 unsafeGrowBuffer   (ABuffer_Int32 arr) bump
  = liftM ABuffer_Int32 $ unsafeGrowBuffer arr bump
 {-# INLINE_ARRAY unsafeGrowBuffer #-}

 unsafeFreezeBuffer (ABuffer_Int32 arr)
  = liftM AArray_Int32  $ unsafeFreezeBuffer arr 
 {-# INLINE_ARRAY unsafeFreezeBuffer #-}

 unsafeThawBuffer   (AArray_Int32 arr)
  = liftM ABuffer_Int32 $ unsafeThawBuffer  arr
 {-# INLINE_ARRAY unsafeThawBuffer #-}

 unsafeSliceBuffer st len (ABuffer_Int32 buf)
  = liftM ABuffer_Int32 $ unsafeSliceBuffer st len buf
 {-# INLINE_ARRAY unsafeSliceBuffer #-}

 touchBuffer (ABuffer_Int32 buf)
  = touchBuffer buf
 {-# INLINE_ARRAY touchBuffer #-}

 bufferLayout (ABuffer_Int32 buf)
  = Auto $ A.extent $ bufferLayout buf
 {-# INLINE_ARRAY bufferLayout #-}


--------------------------------------------------------------------------------------------- Int64
instance Bulk A Int64 where
 data Array A Int64               = AArray_Int64 !(Array U Int64)
 layout (AArray_Int64 arr)        = Auto (A.length arr)
 index  (AArray_Int64 arr) ix     = A.index arr ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index  #-}

deriving instance Show (Array A Int64)

instance Windowable A Int64 where
 window st len (AArray_Int64 arr) 
  = AArray_Int64 (window st len arr)
 {-# INLINE_ARRAY window #-}

instance Target A Int64 where
 data Buffer s A Int64            
  = ABuffer_Int64 !(Buffer s U Int64)

 unsafeNewBuffer (Auto len)     
  = liftM ABuffer_Int64 $ unsafeNewBuffer (Unboxed len)
 {-# INLINE_ARRAY unsafeNewBuffer #-}

 unsafeReadBuffer   (ABuffer_Int64 arr) ix
  = unsafeReadBuffer arr ix
 {-# INLINE_ARRAY unsafeReadBuffer #-}

 unsafeWriteBuffer  (ABuffer_Int64 arr) ix x
  = unsafeWriteBuffer arr ix x
 {-# INLINE_ARRAY unsafeWriteBuffer #-}

 unsafeGrowBuffer   (ABuffer_Int64 arr) bump
  = liftM ABuffer_Int64 $ unsafeGrowBuffer arr bump
 {-# INLINE_ARRAY unsafeGrowBuffer #-}

 unsafeFreezeBuffer (ABuffer_Int64 arr)
  = liftM AArray_Int64  $ unsafeFreezeBuffer arr 
 {-# INLINE_ARRAY unsafeFreezeBuffer #-}

 unsafeThawBuffer   (AArray_Int64 arr)
  = liftM ABuffer_Int64 $ unsafeThawBuffer  arr
 {-# INLINE_ARRAY unsafeThawBuffer #-}

 unsafeSliceBuffer st len (ABuffer_Int64 buf)
  = liftM ABuffer_Int64 $ unsafeSliceBuffer st len buf
 {-# INLINE_ARRAY unsafeSliceBuffer #-}

 touchBuffer (ABuffer_Int64 buf)
  = touchBuffer buf
 {-# INLINE_ARRAY touchBuffer #-}

 bufferLayout (ABuffer_Int64 buf)
  = Auto $ A.extent $ bufferLayout buf
 {-# INLINE_ARRAY bufferLayout #-}


--------------------------------------------------------------------------------------------- Float
instance Bulk A Float where
 data Array A Float             = AArray_Float !(Array U Float)
 layout (AArray_Float arr)      = Auto (A.length arr)
 index  (AArray_Float arr) ix   = A.index arr ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index  #-}

deriving instance Show (Array A Float)

instance Windowable A Float where
 window st len (AArray_Float arr) 
  = AArray_Float (window st len arr)
 {-# INLINE_ARRAY window #-}

instance Target A Float where
 data Buffer s A Float            
  = ABuffer_Float !(Buffer s U Float)

 unsafeNewBuffer (Auto len)     
  = liftM ABuffer_Float $ unsafeNewBuffer (Unboxed len)
 {-# INLINE_ARRAY unsafeNewBuffer #-}

 unsafeReadBuffer   (ABuffer_Float arr) ix
  = unsafeReadBuffer arr ix
 {-# INLINE_ARRAY unsafeReadBuffer #-}

 unsafeWriteBuffer  (ABuffer_Float arr) ix x
  = unsafeWriteBuffer arr ix x
 {-# INLINE_ARRAY unsafeWriteBuffer #-}

 unsafeGrowBuffer   (ABuffer_Float arr) bump
  = liftM ABuffer_Float $ unsafeGrowBuffer arr bump
 {-# INLINE_ARRAY unsafeGrowBuffer #-}

 unsafeFreezeBuffer (ABuffer_Float arr)
  = liftM AArray_Float  $ unsafeFreezeBuffer arr 
 {-# INLINE_ARRAY unsafeFreezeBuffer #-}

 unsafeThawBuffer   (AArray_Float arr)
  = liftM ABuffer_Float $ unsafeThawBuffer  arr
 {-# INLINE_ARRAY unsafeThawBuffer #-}

 unsafeSliceBuffer st len (ABuffer_Float buf)
  = liftM ABuffer_Float $ unsafeSliceBuffer st len buf
 {-# INLINE_ARRAY unsafeSliceBuffer #-}

 touchBuffer (ABuffer_Float buf)
  = touchBuffer buf
 {-# INLINE_ARRAY touchBuffer #-}

 bufferLayout (ABuffer_Float buf)
  = Auto $ A.extent $ bufferLayout buf
 {-# INLINE_ARRAY bufferLayout #-}


-------------------------------------------------------------------------------------------- Double
instance Bulk A Double where
 data Array A Double             = AArray_Double !(Array U Double)
 layout (AArray_Double arr)      = Auto (A.length arr)
 index  (AArray_Double arr) ix   = A.index arr ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index  #-}

deriving instance Show (Array A Double)

instance Windowable A Double where
 window st len (AArray_Double arr) 
  = AArray_Double (window st len arr)
 {-# INLINE_ARRAY window #-}

instance Target A Double where
 data Buffer s A Double            
  = ABuffer_Double !(Buffer s U Double)

 unsafeNewBuffer (Auto len)     
  = liftM ABuffer_Double $ unsafeNewBuffer (Unboxed len)
 {-# INLINE_ARRAY unsafeNewBuffer #-}

 unsafeReadBuffer   (ABuffer_Double arr) ix
  = unsafeReadBuffer arr ix
 {-# INLINE_ARRAY unsafeReadBuffer #-}

 unsafeWriteBuffer  (ABuffer_Double arr) ix x
  = unsafeWriteBuffer arr ix x
 {-# INLINE_ARRAY unsafeWriteBuffer #-}

 unsafeGrowBuffer   (ABuffer_Double arr) bump
  = liftM ABuffer_Double $ unsafeGrowBuffer arr bump
 {-# INLINE_ARRAY unsafeGrowBuffer #-}

 unsafeFreezeBuffer (ABuffer_Double arr)
  = liftM AArray_Double  $ unsafeFreezeBuffer arr 
 {-# INLINE_ARRAY unsafeFreezeBuffer #-}

 unsafeThawBuffer   (AArray_Double arr)
  = liftM ABuffer_Double $ unsafeThawBuffer  arr
 {-# INLINE_ARRAY unsafeThawBuffer #-}

 unsafeSliceBuffer st len (ABuffer_Double buf)
  = liftM ABuffer_Double $ unsafeSliceBuffer st len buf
 {-# INLINE_ARRAY unsafeSliceBuffer #-}

 touchBuffer (ABuffer_Double buf)
  = touchBuffer buf
 {-# INLINE_ARRAY touchBuffer #-}

 bufferLayout (ABuffer_Double buf)
  = Auto $ A.extent $ bufferLayout buf
 {-# INLINE_ARRAY bufferLayout #-}


---------------------------------------------------------------------------------------------- Char
instance Bulk A Char where
 data Array A Char              = AArray_Char !(Array U Char)
 layout (AArray_Char arr)       = Auto (A.length arr)
 index  (AArray_Char arr) ix    = A.index arr ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index  #-}

deriving instance Show (Array A Char)

instance Windowable A Char where
 window st len (AArray_Char arr) 
  = AArray_Char (window st len arr)
 {-# INLINE_ARRAY window #-}

instance Target A Char where
 data Buffer s A Char            
  = ABuffer_Char !(Buffer s U Char)

 unsafeNewBuffer (Auto len)     
  = liftM ABuffer_Char $ unsafeNewBuffer (Unboxed len)
 {-# INLINE_ARRAY unsafeNewBuffer #-}

 unsafeReadBuffer   (ABuffer_Char arr) ix
  = unsafeReadBuffer arr ix
 {-# INLINE_ARRAY unsafeReadBuffer #-}

 unsafeWriteBuffer  (ABuffer_Char arr) ix x
  = unsafeWriteBuffer arr ix x
 {-# INLINE_ARRAY unsafeWriteBuffer #-}

 unsafeGrowBuffer   (ABuffer_Char arr) bump
  = liftM ABuffer_Char $ unsafeGrowBuffer arr bump
 {-# INLINE_ARRAY unsafeGrowBuffer #-}

 unsafeFreezeBuffer (ABuffer_Char arr)
  = liftM AArray_Char  $ unsafeFreezeBuffer arr 
 {-# INLINE_ARRAY unsafeFreezeBuffer #-}

 unsafeThawBuffer   (AArray_Char arr)
  = liftM ABuffer_Char $ unsafeThawBuffer  arr
 {-# INLINE_ARRAY unsafeThawBuffer #-}

 unsafeSliceBuffer st len (ABuffer_Char buf)
  = liftM ABuffer_Char $ unsafeSliceBuffer st len buf
 {-# INLINE_ARRAY unsafeSliceBuffer #-}

 touchBuffer (ABuffer_Char buf)
  = touchBuffer buf
 {-# INLINE_ARRAY touchBuffer #-}

 bufferLayout (ABuffer_Char buf)
  = Auto $ A.extent $ bufferLayout buf
 {-# INLINE_ARRAY bufferLayout #-}


----------------------------------------------------------------------------------------------- (,)
instance (Bulk A a, Bulk A b) => Bulk A (a, b) where
 data Array A (a, b)            = AArray_T2 !(Array (T2 A A) (a, b))
 layout (AArray_T2 arr)         = Auto (A.length arr)
 index  (AArray_T2 arr) ix      = A.index arr ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index  #-}

deriving instance (Show (Array (T2 A A) (a, b)))
                => Show (Array A (a, b))

instance (Windowable A a, Windowable A b)
      =>  Windowable A (a, b) where
 window st len (AArray_T2 arr) 
  = AArray_T2 (window st len arr)
 {-# INLINE_ARRAY window #-}

instance (Target A a, Target A b)
       => Target A (a, b) where
 data Buffer s A (a, b)            
  = ABuffer_T2 !(Buffer s (T2 A A) (a, b))

 unsafeNewBuffer (Auto len)     
  = liftM ABuffer_T2 $ unsafeNewBuffer (Tup2 (Auto len) (Auto len))
 {-# INLINE_ARRAY unsafeNewBuffer #-}

 unsafeReadBuffer   (ABuffer_T2 arr) ix
  = unsafeReadBuffer arr ix
 {-# INLINE_ARRAY unsafeReadBuffer #-}

 unsafeWriteBuffer  (ABuffer_T2 arr) ix x
  = unsafeWriteBuffer arr ix x
 {-# INLINE_ARRAY unsafeWriteBuffer #-}

 unsafeGrowBuffer   (ABuffer_T2 arr) bump
  = liftM ABuffer_T2  $ unsafeGrowBuffer arr bump
 {-# INLINE_ARRAY unsafeGrowBuffer #-}

 unsafeFreezeBuffer (ABuffer_T2 arr)
  = liftM AArray_T2   $ unsafeFreezeBuffer arr 
 {-# INLINE_ARRAY unsafeFreezeBuffer #-}

 unsafeThawBuffer   (AArray_T2 arr)
  = liftM ABuffer_T2  $ unsafeThawBuffer  arr
 {-# INLINE_ARRAY unsafeThawBuffer #-}

 unsafeSliceBuffer st len (ABuffer_T2 buf)
  = liftM ABuffer_T2  $ unsafeSliceBuffer st len buf
 {-# INLINE_ARRAY unsafeSliceBuffer #-}

 touchBuffer (ABuffer_T2 buf)
  = touchBuffer buf
 {-# INLINE_ARRAY touchBuffer #-}

 bufferLayout (ABuffer_T2 buf)
  = Auto $ A.extent $ bufferLayout buf
 {-# INLINE_ARRAY bufferLayout #-}


----------------------------------------------------------------------------------------------- :*:
instance (Bulk A a, Bulk A b) => Bulk A (a :*: b) where
 data Array A (a :*: b)            = AArray_Prod !(Array A a) !(Array A b)
 layout (AArray_Prod arrA _ )      = Auto (A.length arrA)
 index  (AArray_Prod arrA arrB) ix = A.index arrA ix :*: A.index arrB ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index  #-}

deriving instance (Show (Array A a), Show (Array A b))
                => Show (Array A (a :*: b))

instance (Windowable A a, Windowable A b)
      =>  Windowable A (a :*: b) where
 window st len (AArray_Prod arrA arrB) 
  = AArray_Prod (window st len arrA) (window st len arrB)
 {-# INLINE_ARRAY window #-}


instance (Target A a, Target A b)
       => Target A (a :*: b) where
 data Buffer s A (a :*: b)            
  = ABuffer_Prod !(Buffer s A a) !(Buffer s A b)

 unsafeNewBuffer l     
  = liftM2 ABuffer_Prod (unsafeNewBuffer l) (unsafeNewBuffer l)
 {-# INLINE_ARRAY unsafeNewBuffer #-}

 unsafeReadBuffer   (ABuffer_Prod bufA bufB) ix
  = do  xA      <- unsafeReadBuffer bufA ix
        xB      <- unsafeReadBuffer bufB ix
        return  (xA :*: xB)
 {-# INLINE_ARRAY unsafeReadBuffer #-}

 unsafeWriteBuffer  (ABuffer_Prod bufA bufB) ix (xA :*: xB)
  = do  unsafeWriteBuffer bufA ix xA
        unsafeWriteBuffer bufB ix xB
 {-# INLINE_ARRAY unsafeWriteBuffer #-}

 unsafeGrowBuffer   (ABuffer_Prod bufA bufB) bump
  = do  bufA'   <- unsafeGrowBuffer bufA bump
        bufB'   <- unsafeGrowBuffer bufB bump
        return  $ ABuffer_Prod bufA' bufB'
 {-# INLINE_ARRAY unsafeGrowBuffer #-}

 unsafeFreezeBuffer (ABuffer_Prod bufA bufB)
  = do  arrA    <- unsafeFreezeBuffer bufA
        arrB    <- unsafeFreezeBuffer bufB
        return  $ AArray_Prod arrA arrB
 {-# INLINE_ARRAY unsafeFreezeBuffer #-}

 unsafeThawBuffer   (AArray_Prod arrA arrB)
  = do  bufA    <- unsafeThawBuffer  arrA
        bufB    <- unsafeThawBuffer  arrB
        return  $  ABuffer_Prod bufA bufB
 {-# INLINE_ARRAY unsafeThawBuffer #-}

 unsafeSliceBuffer st len (ABuffer_Prod bufA bufB)
  = do  bufA'   <- unsafeSliceBuffer st len bufA
        bufB'   <- unsafeSliceBuffer st len bufB
        return  $  ABuffer_Prod bufA' bufB'
 {-# INLINE_ARRAY unsafeSliceBuffer #-}

 touchBuffer (ABuffer_Prod bufA bufB)
  = do  touchBuffer bufA
        touchBuffer bufB
 {-# INLINE_ARRAY touchBuffer #-}

 bufferLayout (ABuffer_Prod bufA _)
  =     bufferLayout bufA
 {-# INLINE_ARRAY bufferLayout #-}


----------------------------------------------------------------------------------------------- []
instance Bulk A a => Bulk A [a] where
 data Array A [a]               = AArray_List !(Array B [a])
 layout (AArray_List arr)       = Auto (A.length arr)
 index  (AArray_List arr) ix    = A.index arr ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index  #-}

deriving instance Show a => Show (Array A [a])

instance Bulk A a => Windowable A [a] where
 window st len (AArray_List arr) 
  = AArray_List (window st len arr)
 {-# INLINE_ARRAY window #-}

instance  Target A [a] where
 data Buffer s A [a]
  = ABuffer_List !(Buffer s B [a])

 unsafeNewBuffer (Auto len)     
  = liftM ABuffer_List $ unsafeNewBuffer (Boxed len)
 {-# INLINE_ARRAY unsafeNewBuffer #-}

 unsafeReadBuffer   (ABuffer_List arr) ix
  = unsafeReadBuffer arr ix
 {-# INLINE_ARRAY unsafeReadBuffer #-}

 unsafeWriteBuffer  (ABuffer_List arr) ix x
  = unsafeWriteBuffer arr ix x
 {-# INLINE_ARRAY unsafeWriteBuffer #-}

 unsafeGrowBuffer   (ABuffer_List arr) bump
  = liftM ABuffer_List  $ unsafeGrowBuffer arr bump
 {-# INLINE_ARRAY unsafeGrowBuffer #-}

 unsafeFreezeBuffer (ABuffer_List arr)
  = liftM AArray_List   $ unsafeFreezeBuffer arr 
 {-# INLINE_ARRAY unsafeFreezeBuffer #-}

 unsafeThawBuffer   (AArray_List arr)
  = liftM ABuffer_List  $ unsafeThawBuffer  arr
 {-# INLINE_ARRAY unsafeThawBuffer #-}

 unsafeSliceBuffer st len (ABuffer_List buf)
  = liftM ABuffer_List  $ unsafeSliceBuffer st len buf
 {-# INLINE_ARRAY unsafeSliceBuffer #-}

 touchBuffer (ABuffer_List buf)
  = touchBuffer buf
 {-# INLINE_ARRAY touchBuffer #-}

 bufferLayout (ABuffer_List buf)
  = Auto $ A.extent $ bufferLayout buf
 {-# INLINE_ARRAY bufferLayout #-}


--------------------------------------------------------------------------------------------- Array
instance (Bulk A a, Windowable A a) 
       => Bulk A (Array A a) where
 data Array A (Array A a)       = AArray_Array !(Array B (Array A a))
 layout (AArray_Array arr)      = Auto (A.length arr)
 index  (AArray_Array arr) ix   = A.index arr ix
 {-# INLINE_ARRAY layout #-}
 {-# INLINE_ARRAY index #-}


-- 
-- unpack :: Target A (Value format)
--        => format
--        -> Array F Word8
--        -> Array A (Value format)
--
-- unpack (Int32be :*: FixString ASCII 4 :*: Double32be) arr
        
