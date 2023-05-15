/*
  Warnings:

  - You are about to drop the `geoLocations` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `members` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "geoLocations" DROP CONSTRAINT "geoLocations_userId_fkey";

-- DropForeignKey
ALTER TABLE "members" DROP CONSTRAINT "members_userId_fkey";

-- DropTable
DROP TABLE "geoLocations";

-- DropTable
DROP TABLE "members";

-- DropTable
DROP TABLE "users";

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "healthPackage" TEXT,
    "tests" TEXT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "gender" TEXT,
    "age" TEXT,
    "mobile" TEXT,
    "password" TEXT NOT NULL,
    "address" TEXT,
    "distance" TEXT,
    "dob" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GeoLocation" (
    "lat" TEXT NOT NULL,
    "long" TEXT NOT NULL,
    "userId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Member" (
    "id" TEXT NOT NULL,
    "members" TEXT[],
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Member_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "GeoLocation_userId_key" ON "GeoLocation"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Member_userId_key" ON "Member"("userId");

-- AddForeignKey
ALTER TABLE "GeoLocation" ADD CONSTRAINT "GeoLocation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Member" ADD CONSTRAINT "Member_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
