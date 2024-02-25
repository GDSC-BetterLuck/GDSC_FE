// const String baseUrl = "https://api.openrouteservice.org/v2/directions/driving-car";
// const String apiKey = "5b3ce3597851110001cf62488f99d9de3e9a4eb4a76c1bb0e7e35e1f";

// getRoutUrl(String startPoint, String endPoint){
//   return Uri.parse('$baseUrl?api_key=$apiKey&start=$startPoint&end=$endPoint');
// }
const String baseUrl = 'https://api.openrouteservice.org/v2/directions/driving-car';
const String apiKey = '5b3ce3597851110001cf62488f99d9de3e9a4eb4a76c1bb0e7e35e1f';

getRouteUrl(String startPoint, String endPoint){
  return Uri.parse('$baseUrl?api_key=$apiKey&start=$startPoint&end=$endPoint');
}

getLogin(){
  return Uri.parse("https://gdsc-be.onrender.com/v1/user/login");
}