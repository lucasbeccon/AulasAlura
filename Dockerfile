FROM python:3.13.4-alpine3.22

WORKDIR /app

# Copia apenas o arquivo de dependências primeiro para aproveitar o cache do Docker.
# A instalação das dependências só será executada novamente se o requirements.txt mudar.
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação
COPY . .

# Expõe a porta que a aplicação irá rodar
EXPOSE 8000

# Comando para iniciar a aplicação com Uvicorn.
# O FastAPI precisa de um servidor ASGI como o Uvicorn para rodar.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

