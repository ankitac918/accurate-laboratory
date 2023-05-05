import { IsString } from 'class-validator';

export class PlanDto {
  @IsString()
  testsId: string;

  @IsString()
  planeName: string;

  @IsString()
  price: string;
}
