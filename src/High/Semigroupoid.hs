{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Semigroupoid where
  import NaturalTransformation (NaturalTransformation)
  
  data Semigroupoid where
    Semigroupoid ::
      { compose :: (forall f g h. NaturalTransformation cat dat g h -> NaturalTransformation cat dat f g -> NaturalTransformation cat dat f h)
      } -> Semigroupoid cat dat