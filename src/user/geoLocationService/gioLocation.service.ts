import { ForbiddenException, Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { GeoLocationDto } from '../dtos/geoLocation.dto';

@Injectable()
export class GeoLoacationService {
  constructor(private prisma: PrismaService) {}
  async createGeoLocation(dto: GeoLocationDto) {
    try {
      const Geolocation =this.prisma.geoLocation.create({
        data: {
          lat: dto.lat,
          long: dto.long,
          user_id: dto.user_id,
        },
      });
      console.log(Geolocation);

      return Geolocation;
    } catch (error) {
      throw error;
    }
  }

  findAll() {
    return this.prisma.geoLocation.findMany();
  }
}
