export class RestUrl {
  public static get login(): string { return `login`; }
  public static get signUp(): string { return `users/register`; }
  public static get mightBeLike(): string { return `resources`; }
  public static get getClubsDetails(): string { return `resources?category='club'`; }
  public static get getRestaurantsDetails(): string { return `resources?category='Restaurant'`; }
  public static get getHotelsDetails(): string { return `resources?category='hotel'`; }
  public static get getResourceById(): string { return `resourcesbyid?id=`; }
  public static get getBNBResourceById(): string { return `resources/allbnbs?id=`; }
  public static get getAllBNB(): string { return `resources/allbnbs`; }
  public static get getfilterData(): string { return `resources/filters`; }
  public static get sendOTP(): string { return `users/checkotp`; }
  public static get writeReview(): string { return `reviews/add`; }
  public static get getUserReview(): string { return `reviews?category=`; }
}
