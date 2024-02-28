import { Controller, Get, UseInterceptors } from '@nestjs/common';
import { AppService } from './app.service';
import { CurrentUser } from './auth/decorators/current-user.decorator';
import { User } from './user/entities/user.entity';
import { CacheInterceptor, CacheTTL } from '@nestjs/cache-manager';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @UseInterceptors(CacheInterceptor)
  @CacheTTL(60)
  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @UseInterceptors(CacheInterceptor)
  @CacheTTL(60)
  @Get('/me')
  getMe(@CurrentUser() currentUser: User) {
    return currentUser;
  }
}
