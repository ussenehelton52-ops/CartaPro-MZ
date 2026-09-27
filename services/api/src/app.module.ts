import { Module } from '@nestjs/common';
import { QuestionsController } from './questions/questions.controller';
import { QuestionsService } from './questions/questions.service';
import { ExamsController } from './exams/exams.controller';
import { ExamsService } from './exams/exams.service';
import { HealthController } from './health.controller';

@Module({
  controllers: [HealthController, QuestionsController, ExamsController],
  providers: [QuestionsService, ExamsService],
})
export class AppModule {}
