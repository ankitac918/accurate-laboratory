/*
  Warnings:

  - You are about to drop the `GeoLocation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Member` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "GeoLocation" DROP CONSTRAINT "GeoLocation_userId_fkey";

-- DropForeignKey
ALTER TABLE "Member" DROP CONSTRAINT "Member_userId_fkey";

-- DropTable
DROP TABLE "GeoLocation";

-- DropTable
DROP TABLE "Member";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "healthPackage" TEXT,
    "tests" TEXT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "gender" TEXT,
    "age" TEXT,
    "mobile" TEXT,
    "hashPassword" TEXT NOT NULL,
    "address" TEXT,
    "distance" TEXT,
    "dob" TEXT,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "geoLocations" (
    "lat" TEXT NOT NULL,
    "long" TEXT NOT NULL,
    "userId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "members" (
    "id" TEXT NOT NULL,
    "members" TEXT[],
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "userId" TEXT NOT NULL,

    CONSTRAINT "members_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "geoLocations_userId_key" ON "geoLocations"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "members_userId_key" ON "members"("userId");

-- AddForeignKey
ALTER TABLE "geoLocations" ADD CONSTRAINT "geoLocations_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "members" ADD CONSTRAINT "members_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
