import { IsNumber, IsString } from 'class-validator';

export class SlotTimeDto {
  @IsNumber()
  allowed: number;

  @IsNumber()
  booked: number;

  @IsString()
  name: string;
}
