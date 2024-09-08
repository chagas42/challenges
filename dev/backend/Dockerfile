# Imagem base
FROM node:16.17.1-alpine as development

# Definir diretório de trabalho
WORKDIR /app

# Copiar arquivos de dependências
COPY package.json yarn.lock ./

# Instalar dependências
RUN yarn install

# Instalar o NestJS CLI globalmente
RUN yarn global add @nestjs/cli

# Copiar o resto dos arquivos do projeto
COPY . .

# Gerar o Prisma Client
RUN yarn prisma generate

# Expor a porta que a aplicação usa
EXPOSE 3003

# Comando para iniciar a aplicação
CMD ["yarn", "start:dev"]