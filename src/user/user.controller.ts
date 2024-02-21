import { Body, Controller, HttpCode, HttpStatus, Post } from '@nestjs/common';
import { UserService } from './user.service';
import { RegisterUserDto } from './dtos/register.dto';

@Controller('user')
export class UserController {
    constructor(private readonly userService: UserService) { }

    @Post('register')
    @HttpCode(HttpStatus.OK)
    register(@Body() registerUserDto: RegisterUserDto) {
        return this.userService.register(registerUserDto)
    }
}
