context("PubMed tag substitution")

# nolint start
ids <- c("20345488", "20600793")
years <- c("2010", "2010")
journals <- c("Cellular microbiology", "Microbial pathogenesis")
titles <- c("The Anaplasma phagocytophilum-occupied vacuole selectively recruits Rab-GTPases that are predominantly associated with recycling endosomes.",
    "Anaplasma phagocytophilum APH_0032 is expressed late during infection and localizes to the pathogen-occupied vacuolar membrane.")
# nolint end
test_that("PubMed tag retrieval", {
  skip_on_cran()
  expect_equal(query_pubmed(ids, "year"), years)
  sleep_if_keyless()

  expect_equal(query_pubmed(ids, "journal"), journals)
  sleep_if_keyless()

  expect_equal(query_pubmed(ids, "title"), titles)
  sleep_if_keyless()
})

test_that("PubMed tag substitution", {
  skip_on_cran()
  url <- "https://pubmed.ncbi.nlm.nih.gov/20345488"
  id <- ids[1]

  ref  <- sprintf(hl, url, years[1])
  link <- link_pubmed(id, "<year>", format = "html")
  expect_equal(link, ref)
  sleep_if_keyless()

  ref  <- sprintf(hl, url, journals[1])
  link <- link_pubmed(id, "<journal>", format = "html")
  expect_equal(link, ref)
  sleep_if_keyless()

  ref  <- sprintf(hl, url, titles[1])
  link <- link_pubmed(id, "<title>", format = "html")
  expect_equal(link, ref)
})
