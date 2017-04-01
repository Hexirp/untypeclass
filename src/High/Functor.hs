{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Functor where
  import High.Category (Category)

  data Functor :: ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *)) -> * where
    Functor ::
      { sourceCategory :: Category cat
      , targetCategory :: Category dat
      , fmap :: (forall f g. cat f g -> dat (h f) (h g))
      } -> Functor cat dat h
