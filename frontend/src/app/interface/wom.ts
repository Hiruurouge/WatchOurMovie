export interface UserI {
  uid: number
  first_name: string
  last_name: string
  genre: string
  age: number
}
export interface GroupI {
  uid: number
  group_name:string
  owner:number
}
export interface GenreI {
  uid: number
  name:string
}
export interface StaffI{
  name: string,
  uid: number,
  job: string
}
export interface ProdI{
  uid: number,
  name: string

}
export interface ProductionI{
  uid: number;
  name: string;
}
export interface MovieDataI {
  genres: GenreI[];
  staffs: StaffI[];
  productions: ProductionI[];
}
export interface MovieI{
  uid: number
  release_date?:string
  overview? : string
  poster?: string
  popularity?: number
}

