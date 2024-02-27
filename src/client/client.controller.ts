import { Body, Controller, HttpCode, HttpStatus, Post, UseInterceptors } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { ClientService } from './client.service';
import { CacheInterceptor } from '@nestjs/cache-manager';
import { CreateClientDto } from './dtos/create-client.dto';

@ApiTags('client')
@Controller('client')
export class ClientController {
    constructor(private readonly clientService: ClientService){}

    @UseInterceptors(CacheInterceptor)
    @Post('create-client')
    @HttpCode(HttpStatus.OK)
    create(@Body() createClientDto: CreateClientDto){
        return this.clientService.createClient(createClientDto)
    }
}
