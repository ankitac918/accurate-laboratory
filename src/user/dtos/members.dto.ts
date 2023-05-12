import { IsArray, IsString } from "class-validator"

export class MembersDto {
    @IsArray()
    members:string[]

    @IsString()
    name:string

    @IsString()
    description:string

    @IsString()
    price:string

    @IsString()
    user_id:string
}
