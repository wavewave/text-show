{-# OPTIONS_GHC -fno-warn-orphans #-}

{-|
Module:      Instances.System.Exit
Copyright:   (C) 2014-2017 Ryan Scott
License:     BSD-style (see the file LICENSE)
Maintainer:  Ryan Scott
Stability:   Provisional
Portability: GHC

'Arbitrary' instance for 'ExitCode'.
-}
module Instances.System.Exit () where

import Data.Orphans ()
import Generics.Deriving.Base ()
import Instances.Utils.GenericArbitrary (genericArbitrary)
import System.Exit (ExitCode(..))
import Test.QuickCheck (Arbitrary(..))

instance Arbitrary ExitCode where
    arbitrary = genericArbitrary
