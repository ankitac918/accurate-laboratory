import { IsNumber, IsOptional, IsString } from 'class-validator';

export class GeoLocationDto {
  @IsNumber()
  lat: number;

  @IsNumber()
  long: number;

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
