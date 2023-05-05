import { IsString } from 'class-validator';

export class GeoLocationDto {
  @IsString()
  lat: string;

  @IsString()
  long: string;

  @IsString()
  userId: string;
}
