import { ForbiddenException, Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';
import { GeoLocationDto } from '../dtos/geoLocation.dto';

@Injectable()
export class GeoLoacationService {
  constructor(private prisma: PrismaService) {}
  async createGeoLocation(dto: GeoLocationDto) {
    try {
      const Geolocation = await this.prisma.geoLocation.create({
        data: {
          lat: dto.lat,
          long: dto.long,
          userId: dto.userId,
        },
      });
      console.log(Geolocation);

      return Geolocation;
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === 'P2002') {
          throw new ForbiddenException('Credentials taken');
        }
      }
      throw error;
    }
  }

  findAll() {
    return this.prisma.geoLocation.findMany();
  }
}
