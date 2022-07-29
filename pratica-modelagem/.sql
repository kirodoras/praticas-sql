-- Cria o banco de dados
CREATE DATABASE "praticamodelagem";

-- Cria tabela de states
CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
);

-- Cria tabela de cities
CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

-- Cria tabela de customers
CREATE TABLE "customers" (
    "id" SERIAL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
	"cpf" INTEGER UNIQUE NOT NULL,
	"email" TEXT UNIQUE NOT NULL,
	"password" TEXT NOT NULL
);

-- Cria tabela de customerAddresses
CREATE TABLE "customerAddresses" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"street" INTEGER NOT NULL,
	"number" INTEGER NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" INTEGER NOT NULL,
	"cityId" INTEGER NOT NULL  REFERENCES "cities"("id")
);

-- Cria tabela de customerPhones
CREATE TABLE "customerPhones" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "phone" INTEGER NOT NULL,
	"type" TEXT NOT NULL
);

-- Cria tabela de bankAccount
CREATE TABLE "bankAccount" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountnumber" INTEGER NOT NULL,
    "agency" INTEGER NOT NULL,
    "openDate" TIMESTAMP NOT NULL DEFAULT NOW(),
	"closeDate" TIMESTAMP NOT NULL
);

-- Cria tabela de transactions
CREATE TABLE "transactions" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "amount" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "time" TIMESTAMP NOT NULL DEFAULT NOW(),
	"description" TEXT NOT NULL,
	"cancelled" BOOLEAN NOT NULL DEFAULT FALSE
);

-- Cria tabela de creditCards
CREATE TABLE "creditCards" (
    "id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"name" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
	"securityCode" INTEGER NOT NULL,
    "expirationMonth" INTEGER NOT NULL,
    "expirationYear" INTEGER NOT NULL,
    "password" TEXT NOT NULL,
    "limit" INTEGER NOT NULL
);