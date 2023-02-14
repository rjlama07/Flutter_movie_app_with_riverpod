//baseUrl and API key
const String apiKey = '85b9491c903a2b128afc01a33d1f4f6c';
const String baseUrl = 'https://api.themoviedb.org';
const String imageApi = 'https://image.tmdb.org/t/p/original';

//end points
const String trendingMovieApi = 'trending/all/day';
const String discoverUrl = 'discover/movie';
const String popularMovie = "$baseUrl/3/movie/popular";
const String upComming = "$baseUrl/3/movie/upcoming";
const String topRatedMovie = "$baseUrl/3/movie/top_rated";
const String searchMovie = "$baseUrl/3/search/movie";
const String trendingMovie = "$baseUrl/3/trending/all/day";
const String recommendedMovie = "$baseUrl/3/movie/recommendations";
///API URL PATTERN=baseurl+endpoint+apiKey
// https://api.themoviedb.org/3/movie/{movie_id}/recommendations