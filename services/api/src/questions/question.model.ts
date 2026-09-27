export type DrivingCategory = 'ligeiro' | 'pesado' | 'profissional';
export type QuestionTopic = 'sinais' | 'circulacao' | 'prioridade' | 'infracoes';

export interface QuestionOption {
  id: string;
  label: string;
}

export interface Question {
  id: string;
  category: DrivingCategory;
  topic: QuestionTopic;
  statement: string;
  options: QuestionOption[];
  correctOptionId: string;
  explanation: string;
  source?: string;
  active: boolean;
}

export interface QuestionSummary extends Omit<Question, 'correctOptionId'> {
  correctOptionId?: never;
}
