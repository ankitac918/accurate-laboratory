import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';
import { MembersDto } from 'src/user/dtos/members.dto';
import { MembershipDto } from './dto/membership.dto';

@Injectable()
export class MembershipService {
  constructor(private prisma: PrismaService) {}

  async createMembership(data: Prisma.MembershipCreateInput): Promise<any> {
    try {
      const membership = await this.prisma.membership.create({
        data: {
          ...data,
          active: true,
        },
      });
      return membership;
    } catch (error) {
      throw error;
    }
  }

  findAll() {
    return this.prisma.membership.findMany();
  }

  getById(id: string) {
    return this.prisma.membership.findUnique({ where: { id: id } });
  }

  update(id: string, membership: MembershipDto) {
    return this.prisma.membership.updateMany({
      where: { id: id },
      data: membership,
    });
  }

  delete(id: string) {
    return this.prisma.membership.delete({ where: { id: id } });
  }
}
