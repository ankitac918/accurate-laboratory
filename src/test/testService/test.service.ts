import { ForbiddenException, Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { Prisma, Test } from '@prisma/client';
import { TestDto } from '../dtos/Test.dto';

@Injectable()
export class TestService {
  constructor(private prisma: PrismaService) {}
  async createTest(data: Prisma.TestCreateInput): Promise<Test> {
    try {
      const test = await this.prisma.test.create({
        data,
      });
      console.log(test);

      return test;
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === 'P2002') {
          throw new ForbiddenException('Credentials taken');
        }
      }
      throw error;
    }
  }

  findAllTest() {
    return this.prisma.test.findMany({ include: { plans: true } });
  }

  getData(id: string) {
    return this.prisma.test.findFirst({
      where: { id: id },
      include: { plans: true },
    });
  }

  updatetest(id: string, test: TestDto) {
    return this.prisma.test.updateMany({
      where: { id: id },
      data: test,
    });
  }

  async deleteData(id: string) {
    return this.prisma.test.deleteMany({
      where: { id: id },
    });
  }
}
