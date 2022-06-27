# Remote Authentication Use Case

> ## Caso de sucesso
1. Sistema valida dados ✅
2. Sistema faz uma requisição para a URL da API de Login ✅
3. Sistema valida os dados recebidos pela API
4. Sistema entrega os dados da conta do usuário

> # Exceção - URL inválida
1. Sistema retorna mensagem de erro inesperada

> # Exceção - Dados inválidos
1. Sistema retorna mensagem de erro inesperada ✅

> # Exceção - Resposta inválida
1. Sistema retorna mensagem de erro inesperada

> # Exceção - Falha no Servidor
1. Sistema retorna mensagem de erro inesperada

> # Exceção - Credênciais inválidas
1. Sistema retorna mensagem informando que as credênciais estão erradas