import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { UserService } from './user/user.service';
import { UserController } from './user/user.controller';
import { UserModule } from './user/user.module';
import { PrismaModule } from './prisma/prisma.module';
import { APP_GUARD } from '@nestjs/core';
import { JwtAuthGuard } from './auth/guards/jwt-auth.quard';

@Module({
  imports: [AuthModule, UserModule, PrismaModule],
  controllers: [UserController],
  providers: [UserService, { provide: APP_GUARD, useClass: JwtAuthGuard }],
})
export class AppModule {}
