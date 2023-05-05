import { Controller, Post, Body, Get, Param } from '@nestjs/common';
import { GeoLoacationService } from '../geoLocationService/gioLocation.service';
import { GeoLocationDto } from '../dtos/geoLocation.dto';

@Controller('GeoLocation')
export class GeoLocationController {
  constructor(private geoLocationService: GeoLoacationService) {}

  @Post()
  addLoaction(@Body() dto: GeoLocationDto) {
    return this.geoLocationService.createGeoLocation(dto);
  }

  @Get()
  getAll() {
    return this.geoLocationService.findAll();
  }
}
