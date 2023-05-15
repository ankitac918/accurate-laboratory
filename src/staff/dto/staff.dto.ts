import { IsEmail, IsString } from 'class-validator';

export class StaffDto {
  @IsString()
  name: string;

  @IsString()
  @IsEmail()
  email: string;

  @IsString()
  phone: string;

  @IsString()
  address: string;

  active:boolean
}
