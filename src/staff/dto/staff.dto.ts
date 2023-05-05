import { IsEmail, IsString } from 'class-validator';

export class StaffDto {
  @IsString()
  name: string;

  @IsString()
  @IsEmail()
  email: string;

  @IsString()
  phone: String;

  @IsString()
  address: string;
}
