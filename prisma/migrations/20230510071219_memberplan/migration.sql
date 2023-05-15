/*
  Warnings:

  - You are about to drop the column `descriptiom` on the `MemberPlan` table. All the data in the column will be lost.
  - Added the required column `description` to the `MemberPlan` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "MemberPlan" DROP COLUMN "descriptiom",
ADD COLUMN     "description" TEXT NOT NULL;
