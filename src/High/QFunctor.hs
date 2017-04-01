{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.QFunctor where
  import High.Functor (Functor)

  data QFunctor :: ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> (* -> *)) -> * where
    QFunctor ::
      { extend_functor :: (forall x. Functor cat dat (pro x))
      } -> QFunctor cat dat pro
