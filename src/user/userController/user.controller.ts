import {
  Controller,
  Param,
  Body,
  Post,
  Get,
  Delete,
  Patch,
  HttpException,
  HttpStatus,
} from '@nestjs/common';
import { UserService } from '../userService/user.service';
import { UserDto } from '../dtos/user.dto';
import { UserNotFoundException } from '../exception/userException';
import { User } from '@prisma/client';

@Controller('user')
export class UserController {
  constructor(private userService: UserService) {}

  @Post()
  signup(@Body('email') dto: User) {
    const result = this.userService.signup(dto);
    if (!result) return result;
    else throw new HttpException('Credentials taken', HttpStatus.FORBIDDEN);
  }

  @Get('sigin')
  sigin(@Body() dto: UserDto) {
    return this.userService.sigin(dto);
  }

  @Get('/search')
  findAllUser() {
    return this.userService.findAllUser();
  }

  @Get(':id')
  async getUser(@Param('id') id: string) {
    const fetchUser = await this.userService.getUser(id);
    if (fetchUser != null) return fetchUser;
    else throw new UserNotFoundException();
  }

  @Patch(':id')
  updateUser(@Param('id') id: string, @Body() updateUser: UserDto) {
    const update = this.userService.updateUser(id, updateUser);
    if (updateUser != null) return update;
    else throw new UserNotFoundException();
  }

  @Delete(':id')
  deleteUser(@Param('id') id: string) {
    return this.userService.deleteUser(id);
  }
}
