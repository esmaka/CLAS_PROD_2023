#### FUNCAO PARA RETIRAR ACENTOS
fa <- function(x) iconv(x, to = "ASCII//TRANSLIT")
fa("MãE ")
fa("Picolé Limão da Árvore Botão Às 12 horas")
#######################################################

#### FUNCAO PARA BIGRAM ####
tb1904_bigram <- df_cap1904%>%
  unnest_tokens(bigram,PROD_XPROD_LIMPO,token = "ngrams",n=2)

## Contagem e filtragem de n-gramas
tb1904_bigram %>%
  count(bigram, sort = TRUE)

tb1904_bigrams_separated <- tb1904_bigram %>%
  separate(bigram, c("word1", "word2"), sep = " ")

tb1904_bigrams_filtered <- tb1904_bigrams_separated %>%
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word)

tb1904_bigram_counts <- tb1904_bigrams_filtered %>% 
  count(word1, word2, sort = TRUE)
#######################################################