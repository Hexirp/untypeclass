{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.FunctorCategory where
  import High.Category (Category)
  import NaturalTransformation (NaturalTransformation)

  data FunctorCategory :: (* -> * -> *) -> (* -> * -> *) -> * where
    FunctorCategory ::
      { extend_category :: Category (NaturalTransformation cat dat)
      } -> FunctorCategory cat dat
