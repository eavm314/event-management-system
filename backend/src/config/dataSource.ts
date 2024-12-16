import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import { db, env } from './config';

export const dataSource: TypeOrmModuleOptions = {
  type: 'mysql',
  url: db.url,
  entities: [__dirname + '/../**/*.entity.{js,ts}'],
  synchronize: env.environment === 'develop' ? true : false,
};
