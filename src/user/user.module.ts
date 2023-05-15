import { Module } from '@nestjs/common';
import { UserController } from './userController/user.controller';
import { UserService } from './userService/user.service';
import { GeoLocationController } from './geoLocationcontroller/geoLocation.controller';
import { MemberesController } from './membersController/members.controller';
import { GeoLoacationService } from './geoLocationService/gioLocation.service';
import { MembersService } from './membersService/members.service';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports:[JwtModule.register({})],
  controllers: [UserController,GeoLocationController,MemberesController],
  providers: [UserService,GeoLoacationService,MembersService]
})
export class UserModule {}
