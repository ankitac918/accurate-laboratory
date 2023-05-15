import { IsNumber, IsString } from 'class-validator';

export class MembershipDto {
  @IsString()
  name: string;

  @IsString()
  description: string;

  @IsNumber()
  duration: number;

  @IsNumber()
  price: number;

  active: boolean;
}
