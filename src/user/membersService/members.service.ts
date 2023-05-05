import { ForbiddenException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { MembersDto } from '../dtos/members.dto';

@Injectable()
export class MembersService {
  constructor(private prisma: PrismaService) {}
  async createMember(dto: MembersDto) {
    try {
      const Members = await this.prisma.member.create({
        data: {
          members: dto.members,
          name: dto.name,
          description: dto.description,
          price: dto.price,
          userId: dto.userId,
        },
      });
      console.log(Members);
    } catch (error) {
      throw new ForbiddenException();
    }
  }

  findAll() {
    return this.prisma.member.findMany();
  }

  findById(id: string) {
    return this.prisma.member.findUnique({ where: { id: id } });
  }

  update(id: string, member: MembersDto) {
    return this.prisma.member.updateMany({
      where: { id: id },
      data: member,
    });
  }
}
