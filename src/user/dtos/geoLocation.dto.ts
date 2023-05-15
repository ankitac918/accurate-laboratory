import { IsNumber, IsOptional, IsString } from 'class-validator';

export class GeoLocationDto {
  @IsNumber()
  lat: number;

  @IsNumber()
  long: number;

  @IsString()
  user_id: string;

  @IsString() 
  user: string;

  @IsString()
  @IsOptional()
  Appointment_detail: object;
  Appointment_detail_id: any;
  // user_id: any;
}
