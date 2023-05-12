import { IsString } from 'class-validator';

export class PlanDto {
  @IsString()
  test_id: string;

  @IsString()
  plane_name: string;

  @IsString()
  price: string;
  // plane_name: any;
  // test_id: any;
}
