import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:uni_quest_project/core/features/presentation/gmat_page.dart';

import '../domain/university_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:5000/api', // For Android Emulator
    ),
  );

  // ----- Students API ----- //

  // Create a student
  Future<Response> createStudent({required Map<String, dynamic> data}) async {
    try {
      Response response = await _dio.post('/students', data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to create student: $e');
    }
  }

  // Function to log in a student
  Future<bool> loginStudent(
      {required String email, required String password}) async {
    final Map<String, String> requestBody = {
      'email': email,
      'password': password,
    };

    try {
      // Send POST request
      final Response response = await _dio.post(
        '/students/login',
        data: requestBody,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

// Update a student's details dynamically
  Future<Response> updateStudent({
    required String studentId,
    required Map<String, dynamic> updates,
  }) async {
    try {
      if (updates.isEmpty) {
        throw Exception('No fields to update');
      }
      // Make the PUT request with the updates
      Response response = await _dio.put('/students/$studentId', data: updates);
      return response;
    } catch (e) {
      throw Exception('Failed to update student: $e');
    }
  }

  // Delete a student
  Future<Response> deleteStudent(String studentId) async {
    try {
      Response response = await _dio.delete('/students/$studentId');
      return response;
    } catch (e) {
      throw Exception('Failed to delete student: $e');
    }
  }

  // Create a ranking
  Future<Map<String, dynamic>> createRanking(
      Map<String, dynamic> rankingData) async {
    try {
      final response = await _dio.post('/rankings', data: rankingData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Get all rankings
  Future<List<dynamic>> getAllRankings() async {
    try {
      final response = await _dio.get('/rankings');
      return response.data;
    } catch (e) {
      return [
        {'error': e.toString()}
      ];
    }
  }

  // Get rankings by university ID
  Future<List<dynamic>> getRankingsByUniversityId(String universityId) async {
    try {
      final response = await _dio.get('/rankings/university/$universityId');
      return response.data;
    } catch (e) {
      return [
        {'error': e.toString()}
      ];
    }
  }

  // Get rankings by program ID
  Future<List<dynamic>> getRankingsByProgramId(String programId) async {
    try {
      final response = await _dio.get('/rankings/program/$programId');
      return response.data;
    } catch (e) {
      return [
        {'error': e.toString()}
      ];
    }
  }

  // Update a ranking
  Future<Map<String, dynamic>> updateRanking(
      String rankingId, Map<String, dynamic> updatedData) async {
    try {
      final response =
          await _dio.put('/rankings/$rankingId', data: updatedData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Delete a ranking
  Future<Map<String, dynamic>> deleteRanking(String rankingId) async {
    try {
      final response = await _dio.delete('/rankings/$rankingId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // ----- Universities API ----- //

  // Create a university
  Future<Map<String, dynamic>> createUniversity(
      Map<String, dynamic> universityData) async {
    try {
      final response = await _dio.post('/universities', data: universityData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Get all universities
  Future<List<dynamic>> getAllUniversities() async {
    try {
      final response = await _dio.get('/universities');
      return response.data;
    } catch (e) {
      return [
        {'error': e.toString()}
      ];
    }
  }

  // Get a university by ID
  Future<Map<String, dynamic>> getUniversityById(String universityId) async {
    try {
      final response = await _dio.get('/universities/$universityId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Update a university
  Future<Map<String, dynamic>> updateUniversity(
      String universityId, Map<String, dynamic> updatedData) async {
    try {
      final response =
          await _dio.put('/universities/$universityId', data: updatedData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  Future<List<dynamic>?> searchUniversities(
      {required int minGre,
      required int minToefl,
      required String preferredLocation}) async {
    final String url = '/universities/search';

    // Creating the body for the POST request
    final Map<String, dynamic> body = {
      'min_gre': minGre,
      'min_toefl': minToefl,
      'preferred_location': preferredLocation,
    };

    try {
      // Sending the POST request to the API
      Response response = await _dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            'Content-Type':
                'application/json', // Ensure the server expects JSON
          },
        ),
      );

      // Handling the response
      if (response.statusCode == 200) {
        // Successfully received data
        return response.data['universities'];
      } else {
        // Handle server errors
        print('Error: ${response.data['error']}');
        return null;
      }
    } catch (e) {
      // Handle any errors during the request
      print('Error making request: $e');
      return null;
    }
  }

  // Delete a university
  Future<Map<String, dynamic>> deleteUniversity(String universityId) async {
    try {
      final response = await _dio.delete('/universities/$universityId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // ----- Users API ----- //

  // Create a user
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.post('/users', data: userData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Get all users
  Future<List<dynamic>> getAllUsers() async {
    try {
      final response = await _dio.get('/users');
      return response.data;
    } catch (e) {
      return [
        {'error': e.toString()}
      ];
    }
  }

  // Get a user by ID
  Future<Map<String, dynamic>> getUserById(String userId) async {
    try {
      final response = await _dio.get('/users/$userId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Update a user
  Future<Map<String, dynamic>> updateUser(
      String userId, Map<String, dynamic> updatedData) async {
    try {
      final response = await _dio.put('/users/$userId', data: updatedData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Delete a user
  Future<Map<String, dynamic>> deleteUser(String userId) async {
    try {
      final response = await _dio.delete('/users/$userId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // ----- Wishlist API ----- //

  // Create a wishlist item
  Future<Map<String, dynamic>> createWishlistItem(
      Map<String, dynamic> wishlistData) async {
    try {
      final response = await _dio.post('/wishlist', data: wishlistData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Get all wishlist items
  Future<List<dynamic>> getAllWishlistItems() async {
    try {
      final response = await _dio.get('/wishlist');
      return response.data;
    } catch (e) {
      return [
        {'error': e.toString()}
      ];
    }
  }

  // Get wishlist items by user ID
  Future<List<dynamic>> getWishlistByUserId(String userId) async {
    try {
      final response = await _dio.get('/wishlist/user/$userId');
      return response.data;
    } catch (e) {
      return [
        {'error': e.toString()}
      ];
    }
  }

  // Update a wishlist item
  Future<Map<String, dynamic>> updateWishlistItem(
      String wishlistId, Map<String, dynamic> updatedData) async {
    try {
      final response =
          await _dio.put('/wishlist/$wishlistId', data: updatedData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Delete a wishlist item
  Future<Map<String, dynamic>> deleteWishlistItem(String wishlistId) async {
    try {
      final response = await _dio.delete('/wishlist/$wishlistId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
