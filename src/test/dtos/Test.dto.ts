import { Type } from 'class-transformer';
import { IsAlpha, IsArray, IsString, ValidateNested } from 'class-validator';
import { PlanDto } from './Plan.dto';

export class TestDto {
  @IsString()
  name: string;

  @IsString()
  price: string;

  // @IsArray()
  @ValidateNested()
  @Type(() => PlanDto)
  // @IsNotEmptyObject()
  plans: PlanDto;
}
