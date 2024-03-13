import {
  BadGatewayException,
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Post,
  Request,
  UseInterceptors,
} from '@nestjs/common';
import { UserService } from './user.service';
import { UserDto } from './dtos/user.dto';
import { ApiTags } from '@nestjs/swagger';
import { CacheInterceptor, CacheTTL } from '@nestjs/cache-manager';
import { UserMessagesHelper } from './helpers/messages.helper';

@ApiTags('user')
@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @UseInterceptors(CacheInterceptor)
  @CacheTTL(60)
  @Post('register')
  @HttpCode(HttpStatus.OK)
  register(@Body() userDto: UserDto) {
    return this.userService.register(userDto);
  }

  @UseInterceptors(CacheInterceptor)
  @CacheTTL(60)
  @Get()
  async getUser(@Request() req) {
    const { id } = req?.user;
    const user = await this.userService.findUserById(id);

    if (!user) {
      throw new BadGatewayException(UserMessagesHelper.GET_USER_NOT_FOUND);
    }

    return {
      id: user.id,
      userName: user.userName,
      name: user.name,
      lastName: user.lastName,
    };
  }
}
