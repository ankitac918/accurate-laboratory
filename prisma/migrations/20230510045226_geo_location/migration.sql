/*
  Warnings:

  - Changed the type of `lat` on the `GeoLocation` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `long` on the `GeoLocation` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropIndex
DROP INDEX "AppointmentDetail_geoLocationId_key";

-- AlterTable
ALTER TABLE "GeoLocation" DROP COLUMN "lat",
ADD COLUMN     "lat" INTEGER NOT NULL,
DROP COLUMN "long",
ADD COLUMN     "long" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "slots" ALTER COLUMN "date" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "start" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "end" SET DEFAULT CURRENT_TIMESTAMP;
