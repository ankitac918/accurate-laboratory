import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService extends PrismaClient {
  create(arg0: { data: { active: boolean; id?: string; name: string; description: string; duration: number; price: number; }; }) {
      throw new Error('Method not implemented.');
  }
  delete() {
    throw new Error('Method not implemented.');
  }
  constructor(config: ConfigService) {
    super({
      datasources: {
        db: {
          url: config.get('DATABASE_URL'),
        },
      },
    });
  }
}
