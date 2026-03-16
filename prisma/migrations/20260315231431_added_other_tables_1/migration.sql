/*
  Warnings:

  - You are about to drop the `watchListItem` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Movie" DROP CONSTRAINT "Movie_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "watchListItem" DROP CONSTRAINT "watchListItem_movieId_fkey";

-- DropForeignKey
ALTER TABLE "watchListItem" DROP CONSTRAINT "watchListItem_userId_fkey";

-- DropTable
DROP TABLE "watchListItem";

-- CreateTable
CREATE TABLE "WatchListItem" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "movieId" TEXT NOT NULL,
    "status" "WatchListStatus" NOT NULL DEFAULT 'PLANNED',
    "ratings" INTEGER,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WatchListItem_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Movie" ADD CONSTRAINT "Movie_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WatchListItem" ADD CONSTRAINT "WatchListItem_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WatchListItem" ADD CONSTRAINT "WatchListItem_movieId_fkey" FOREIGN KEY ("movieId") REFERENCES "Movie"("id") ON DELETE CASCADE ON UPDATE CASCADE;
