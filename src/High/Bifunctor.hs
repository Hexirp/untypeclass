{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Bifunctor where
  import High.PFunctor (PFunctor)
  import High.QFunctor (QFunctor)

  data Bifunctor :: ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> (* -> *)) -> * where
    Bifunctor ::
      { extend_pfunctor :: PFunctor cat1 dat pro
      , extend_qfunctor :: QFunctor cat2 dat pro
      } -> Bifunctor cat1 cat2 dat pro