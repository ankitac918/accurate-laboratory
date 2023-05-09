import { IsOptional, IsString } from 'class-validator';

export class GeoLocationDto {
  @IsString()
  lat: string;

  @IsString()
  long: string;

  @IsString()
  userId: string;

  @IsString()
  user: string;

  // @IsString()
  // @IsOptional()
  // AppointmentDetailId: string;

  @IsString()
  @IsOptional()
  AppointmentDetail: object;
  AppointmentDetailId: any;
}
