test_that("theme_arcadia works", {
  expect_s3_class(theme_arcadia(), "theme")
  })

test_that("scale_fill_arcadia works", {
  expect_s3_class(scale_fill_arcadia(), "ScaleDiscrete")
})

test_that("scale_color_arcadia works", {
  expect_s3_class(scale_color_arcadia(), "ScaleDiscrete")
})
