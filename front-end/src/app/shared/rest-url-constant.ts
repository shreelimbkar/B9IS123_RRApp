export class RestUrl {
  public static get getDetail(): string { return `/`; }
  public static get mostViewedProperty(): string { return `/mostViewedProperty`; }
  public static get home(): string { return `/houseForRent`; }
  public static get listingProperty(): string { return `/ListOfProperty`; }
  public static get ascendingSort(): string { return `?_sort=Price&_order=asc`; }
  public static get descendingSort(): string { return `?_sort=Price&_order=desc`; }




}
