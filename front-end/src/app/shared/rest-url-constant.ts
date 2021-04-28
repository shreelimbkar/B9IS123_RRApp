export class RestUrl {
  public static get login(): string { return `login`; }
  public static get signUp(): string { return `users/add`; }
  public static get mightBeLike(): string { return `resources`; }
  public static get getClubsDetails(): string { return `resources?category='club'`; }
  public static get getRestaurantsDetails(): string { return `resources?category='Restaurant'`; }
  public static get getHotelsDetails(): string { return `resources?category='hotel'`; }
  public static get getResourceById(): string { return `resourcesbyid?id=`; }





  public static get getDetail(): string { return `/`; }
  public static get mostViewedProperty(): string { return `/mostViewedProperty`; }
  public static get home(): string { return `/houseForRent`; }
  public static get listingProperty(): string { return `/ListOfProperty`; }
  public static get ascendingSort(): string { return `?_sort=Price&_order=asc`; }
  public static get descendingSort(): string { return `?_sort=Price&_order=desc`; }




}
