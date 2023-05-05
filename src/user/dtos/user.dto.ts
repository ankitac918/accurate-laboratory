import { Type } from 'class-transformer';
import {
  IsString,
  IsEmail,
  IsOptional,
  IsNotEmpty,
  ValidateNested,
  IsObject,
} from 'class-validator';
import { GeoLocationDto } from './geoLocation.dto';
import { MembersDto } from './members.dto';

export class UserDto {
  @IsString()
  @IsOptional()
  healthPackage: string;

  @IsString()
  @IsOptional()
  tests: string;

  @IsString()
  @IsOptional()
  name: string;

  @IsString()
  @IsEmail()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsOptional()
  gender: string;

  @IsString()
  @IsOptional()
  age: string;

  @IsString()
  @IsOptional()
  mobile?: string;

  @IsString()
  @IsNotEmpty()
  password: string;

  @IsString()
  @IsOptional()
  address: string;

  // @IsObject()
  @ValidateNested()
  @Type(() => GeoLocationDto)
  geoLocation: GeoLocationDto;

  @IsString()
  @IsOptional()
  distance: string;

  @IsString()
  @IsOptional()
  dob: string;

  // @IsObject()
  @ValidateNested()
  @Type(() => MembersDto)
  members: MembersDto;
  static password: string | Buffer;
}
