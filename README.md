# Teste de Dev Backend usando Elixir

https://bitbucket.org/delivery_center/test-dev-backend-elixir/src/master/

Para iniciar o serviço:
  * Execute o comando `docker-compose up --build` dentro do diretório raiz do projeto 
  * Será criado um container `delivery_service` (Elixir) na porta 4000 e um serviço `delivery_service_db` (Postgresql) na porta 5432
  * Para obter as credenciais do banco de dados: acessar o arquivo `config/dev.exs`
  * OBS: o arquivo `environment.env` NÃO foi adicionado no `.gitignore` para facilitar a execução do projeto
  
Para rodar os testes da aplicação - após subir o container:
  * Execute o comando `docker exec -ti delivery_service mix test`

Para iniciar verificação da consistência código da aplicação - após subir o container:
  * Executar o comando `docker exec -ti delivery_service mix credo` ou `docker exec -ti delivery_service mix credo --strict`


Para realizar o cadastro de um pedido via curl:
  * `curl --location --request POST 'http://localhost:4000/api/orders' \
     --header 'Content-Type: application/json' \
     --data-raw '{
     	"id": 9987071,
     	"store_id": 282,
     	"date_created": "2019-06-24T16:45:32.000-04:00",
     	"date_closed": "2019-06-24T16:45:35.000-04:00",
     	"last_updated": "2019-06-25T13:26:49.000-04:00",
     	"total_amount": 49.9,
     	"total_shipping": 5.14,
     	"total_amount_with_shipping": 55.04,
     	"paid_amount": 55.04,
     	"expiration_date": "2019-07-22T16:45:35.000-04:00",
     	"order_items": [{
     		"item": {
     			"id": "IT4801901403",
     			"title": "Produto de Testes"
     		},
     		"quantity": 1,
     		"unit_price": 49.9,
     		"full_unit_price": 49.9
     	}],
     	"payments": [{
     		"id": 12312313,
     		"order_id": 9987071,
     		"payer_id": 414138,
     		"installments": 1,
     		"payment_type": "credit_card",
     		"status": "paid",
     		"transaction_amount": 49.9,
     		"taxes_amount": 0,
     		"shipping_cost": 5.14,
     		"total_paid_amount": 55.04,
     		"installment_amount": 55.04,
     		"date_approved": "2019-06-24T16:45:35.000-04:00",
     		"date_created": "2019-06-24T16:45:33.000-04:00"
     	}],
     	"shipping": {
     		"id": 43444211797,
     		"shipment_type": "shipping",
     		"date_created": "2019-06-24T16:45:33.000-04:00",
     		"receiver_address": {
     			"id": 1051695306,
     			"address_line": "Rua Fake de Testes 3454",
     			"street_name": "Rua Fake de Testes",
     			"street_number": "3454",
     			"comment": "teste",
     			"zip_code": "85045020",
     			"city": {
     				"name": "Cidade de Testes"
     			},
     			"state": {
     				"name": "São Paulo"
     			},
     			"country": {
     				"id": "BR",
     				"name": "Brasil"
     			},
     			"neighborhood": {
     				"id": null,
     				"name": "Vila de Testes"
     			},
     			"latitude": -23.629037,
     			"longitude": -46.712689,
     			"receiver_phone": "41999999999"
     		}
     	},
     	"status": "paid",
     	"buyer": {
     		"id": 136226073,
     		"nickname": "JOHN DOE",
     		"email": "john@doe.com",
     		"phone": {
     			"area_code": 41,
     			"number": "999999999"
     		},
     		"first_name": "John",
     		"last_name": "Doe",
     		"billing_info": {
     			"doc_type": "CPF",
     			"doc_number": "09487965477"
     		}
     	}
     }'`

Para realizar a consulta do pedido via curl:
  * `curl --location --request GET 'http://localhost:4000/api/orders/9987071'`
    
    
