import { Injectable } from '@nestjs/common';
import { Client, QueryResult } from 'pg';

const { DB_HOST, DB_PORT, DB_NAME, DB_USERNAME, DB_PASSWORD } = process.env;

@Injectable()
export class DBService {
  public async runQuery<T>(query: string): Promise<T[]> {
    const client = new Client({
      host: DB_HOST,
      port: +DB_PORT,
      database: DB_NAME,
      user: DB_USERNAME,
      password: DB_PASSWORD,
      ssl: {
        rejectUnauthorized: false,
      },
    });
    try {
      await client
        .connect()
        .then(() => console.log('request to db follows with query: ', query));
      const res = await client.query<QueryResult<T>>(query);
      return res.rows as T[];
    } catch (error) {
        console.log(`Error caught: ${error}`);
    } finally {
      await client.end();
    }
  }
}