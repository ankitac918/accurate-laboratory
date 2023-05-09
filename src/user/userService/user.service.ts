import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { UserDto } from '../dtos/user.dto';
import * as argon2 from 'argon2';
import { ForbiddenException } from '@nestjs/common/exceptions';
import { Prisma } from '@prisma/client';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { Exclude } from 'class-transformer';

@Injectable()
export class UserService {
  user: any;
  password: string | Buffer;
  constructor(
    private readonly prisma: PrismaService,
    private jwt: JwtService,
    private config: ConfigService,
  ) {}

  async signup(
    data: Prisma.UserCreateInput
  ): Promise<any> {
    try {
      const passwordHash = await argon2.hash(data.password);
      const user = await this.prisma.user.create({
        data: {
          ...data,
          password: passwordHash,
        },
      });
      return user;
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === 'P2002') {
          throw new ForbiddenException('Credentials taken');
        }
      }
      throw error;
    }
  }

  // **********USER LOGIN **************
  async sigin(dto: UserDto) {
    const user = await this.prisma.user.findUnique({
      where: { email: dto.email },
    });

    if (!user) {
      throw new ForbiddenException('credential incorrect');
    }

    const pwMatch = await argon2.verify(user.password, dto.password);
    if (!pwMatch) {
      throw new ForbiddenException('credential incorrect');
    }
    return this.signToken(user.id, user.email);
  }

  //***** TOKEN *******/
  async signToken(
    userId: string,
    email: string,
  ): Promise<{ eccess_token: string }> {
    const payload = {
      sub: userId,
      email,
    };
    const secret = this.config.get('JWT_SECRET');
    const token = await this.jwt.signAsync(payload, {
      expiresIn: '10min',
      secret: secret,
    });

    return {
      eccess_token: token,
    };
  } //**END OF TOKEN ***//

  findAllUser() {
    return this.prisma.user.findMany({
      include: { geoLocation: true, members: true },
    });
  }

  getUser(id: string) {
    return this.prisma.user.findFirst({
      where: { id: id },
      include: { geoLocation: true, members: true },
    });
  }

  updateUser(id: string, user: UserDto) {
    return this.prisma.user.updateMany({
      where: { id: id },
      data: user,
    });
  }

  async deleteUser(id: string) {
    await this.prisma.geoLocation.deleteMany({ where: { userId: id } });
    await this.prisma.member.deleteMany({ where: { userId: id } });
    return this.prisma.user.delete({
      where: { id: id },
    });
  }
}
