{-# LANGUAGE CPP              #-}

#if __GLASGOW_HASKELL__ >= 702
{-# LANGUAGE FlexibleContexts #-}
#endif
{-|
Module:      Text.Show.Text.Debug.Trace.Generic
Copyright:   (C) 2014-2015 Ryan Scott
License:     BSD-style (see the file LICENSE)
Maintainer:  Ryan Scott
Stability:   Experimental
Portability: GHC

Functions that trace the values of 'Generic' instances (even if they are not
instances of @Show@). This module only exports functions if the compiler supports
generics (on GHC, 7.2 or above).

/Since: 0.6/
-}
module Text.Show.Text.Debug.Trace.Generic (
#if __GLASGOW_HASKELL__ < 702
    ) where
#else
      genericTraceShow
    , genericTraceShowId
    , genericTraceShowM
    ) where

import GHC.Generics (Generic, Rep)

import Text.Show.Text.Debug.Trace
import Text.Show.Text.Generic (GShow, genericShow)

-- | A 'Generic' implementation of 'traceShow'.
-- 
-- /Since: 0.6/
genericTraceShow :: (Generic a, GShow (Rep a)) => a -> b -> b
genericTraceShow = trace . genericShow

-- | A 'Generic' implementation of 'traceShowId'.
-- 
-- /Since: 0.6/
genericTraceShowId :: (Generic a, GShow (Rep a)) => a -> a
genericTraceShowId a = trace (genericShow a) a

-- | A 'Generic' implementation of 'traceShowM'.
-- 
-- /Since: 0.6/
genericTraceShowM :: (Generic a, GShow (Rep a), Monad m) => a -> m ()
genericTraceShowM = traceM . genericShow
#endif