/*
  Warnings:

  - A unique constraint covering the columns `[testsId]` on the table `Plan` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Plan_testsId_key" ON "Plan"("testsId");
