class SearchService

  def self.search(event: required)
    # seleciona os devidos searches e manda para suas respectivas implementações

  end
end

# TODO:

# - Esse service será executado dentro de um job sidekiq ou outro,
#   será um web crawler basicamente. Sabendo dessa estrutura:

# - Iniciará primeiramente recebendo uma lista de objetos do tipo "Service",
#   que estará provenientemente dentro de um evento. (é de onde ele quer buscar!)

# - A partir dessa lista serão chamados métodos de search específicos de cada serviço

# - Dentro de cada método de serviço, será preciso:
#   - Receber um objeto de Evento (pegar a hashtag).
#   - Devida autenticação.
#   - Tratamento de items, provavelmente será feito dentro do base sei lá!
#   - Atenção à chave única de items, pois TODOS serão adicionados ao evento,
#     mas apenas os escolhidos estarão sendo "randomizados".
