{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Functor.PFunctor where
  import High.Functor (Functor)

  data Flip :: ((* -> *) -> (* -> *) -> (* -> *)) -> (* -> *) -> (* -> *) -> * -> * where
    Flip :: (f b a) x -> Flip f a b x

  data PFunctor :: ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> (* -> *)) -> * where
    PFunctor ::
      { extend_functor :: (forall x. Functor cat dat (Flip pro x))
      } -> PFunctor cat dat pro
