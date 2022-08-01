CREATE TABLE "public.users" (
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	"id" serial NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"nome" TEXT NOT NULL UNIQUE,
	"preço" TEXT NOT NULL,
	"fotos" json NOT NULL UNIQUE,
	"id" serial NOT NULL UNIQUE,
	"tamanho" TEXT NOT NULL,
	"categoryId" int NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"productId" int NOT NULL,
	"userId" int NOT NULL,
	"quantidade" int NOT NULL,
	"tamanho" TEXT NOT NULL,
	"status" TEXT NOT NULL,
	"data" TIMESTAMP NOT NULL,
	"addressId" int NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.addresses" (
	"id" serial NOT NULL,
	"userId" serial NOT NULL,
	"cep" TEXT NOT NULL,
	"cidade" TEXT NOT NULL,
	"estado" TEXT NOT NULL,
	"bairro" TEXT NOT NULL,
	"numero" TEXT NOT NULL,
	"rua" TEXT NOT NULL,
	CONSTRAINT "addresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("addressId") REFERENCES "addresses"("id");
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");