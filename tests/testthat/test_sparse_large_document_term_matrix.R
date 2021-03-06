library(SpeedReader)
context("Generate Sparse Document Term Matrix")

test_that("That the sparse document term matricies have the right dimensions and sum", {
    # load data
    # data(document_term_vector_list)
    # data(document_term_count_list)
    files <- get_file_paths(source = "test sparse doc-term")

    # generate first split
    # data(document_term_vector_list)
    # data(document_term_count_list)
    # setwd("~/Dropbox/Research/SpeedReader/data")
    # document_term_vector_list <- document_term_vector_list[1:3]
    # document_term_count_list <- document_term_count_list[1:3]
    # save(list = c("document_term_vector_list","document_term_count_list"),
    #     file = "Block_1.Rdata")

    # generate second split
    # data(document_term_vector_list)
    # data(document_term_count_list)
    # document_term_vector_list <- document_term_vector_list[4:5]
    # document_term_count_list <- document_term_count_list[4:5]
    # save(list = c("document_term_vector_list","document_term_count_list"),
    #      file = "Block_2.Rdata")

    sdtm <- generate_sparse_large_document_term_matrix(
        file_list = files,
        file_directory = NULL,
        vocabulary = NULL,
        maximum_vocabulary_size = -1,
        using_document_term_counts = TRUE)

    expect_equal(35522, ncol(sdtm))
    expect_equal(5, nrow(sdtm))
    expect_equal(69825, sum(sdtm))

    cat("\n")
    data(document_term_vector_list)
    data(document_term_count_list)
    count <- count_words(document_term_vector_list,
                         maximum_vocabulary_size = 1000000,
                         document_term_count_list = document_term_count_list)

    expect_equal(count$word_counts, as.numeric(slam::col_sums(sdtm)))



})
