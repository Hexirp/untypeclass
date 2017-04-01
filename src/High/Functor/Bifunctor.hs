{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Functor.Bifunctor where
  import High.Functor.PFunctor (PFunctor)
  import High.Functor.QFunctor (QFunctor)

  data Bifunctor :: ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> (* -> *)) -> * where
    Bifunctor ::
      { extend_pfunctor :: PFunctor cat1 dat pro
      , extend_qfunctor :: QFunctor cat2 dat pro
      } -> Bifunctor cat1 cat2 dat pro