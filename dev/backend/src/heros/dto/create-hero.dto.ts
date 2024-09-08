import {
  IsEnum,
  IsNumber,
  IsString,
  ValidationArguments,
} from 'class-validator';

export enum Class {
  WARRIOR = 'Warrior',
  MAGE = 'Mage',
  ROGUE = 'Rogue',
  PALADIN = 'Paladin',
  SHAMAN = 'Shaman',
  DRUID = 'Druid',
  HUNTER = 'Hunter',
  WARLOCK = 'Warlock',
}
export class CreateHeroDto {
  @IsString()
  name: string;

  @IsString()
  class: string;

  @IsNumber()
  lati: number;

  @IsNumber()
  longi: number;
}
