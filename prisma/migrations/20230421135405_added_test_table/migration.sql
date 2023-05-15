-- CreateTable
CREATE TABLE "tests" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "homeCollection" BOOLEAN NOT NULL DEFAULT false,
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "outsource" BOOLEAN NOT NULL DEFAULT true,
    "price" TEXT NOT NULL,

    CONSTRAINT "tests_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Plan" (
    "id" TEXT NOT NULL,
    "planeName" TEXT NOT NULL,
    "price" TEXT NOT NULL,

    CONSTRAINT "Plan_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Plan" ADD CONSTRAINT "Plan_id_fkey" FOREIGN KEY ("id") REFERENCES "tests"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
