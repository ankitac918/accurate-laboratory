import { IsNumber, IsString } from "class-validator";

export class memberPlanDto{
    @IsString()
    name:string

    @IsNumber()
    price:number

    @IsString()
    description:string
}