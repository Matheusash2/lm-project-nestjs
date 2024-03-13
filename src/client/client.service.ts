import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateClientDto } from './dtos/create-client.dto';
import { Client } from './entities/client.entity';
import { Prisma } from '@prisma/client';

@Injectable()
export class ClientService {
    constructor(private readonly prisma: PrismaService){}

    async createClient(createClientDto: CreateClientDto):Promise<Client>{

        const data: Prisma.ClientCreateInput = {
            ...createClientDto
        }

        const createClientRegister = await this.prisma.client.create({data});

        return {
            ...createClientRegister
        }
    }
    
    findClientCpf(cpf: string){
        return this.prisma.client.findUnique({where:{cpf}})
    }
}
