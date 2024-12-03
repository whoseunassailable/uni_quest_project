import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:uni_quest_project/core/features/presentation/gmat_page.dart';

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

  // Get all students
  Future<Response> getAllStudents() async {
    try {
      Response response = await _dio.get('/students');
      return response;
    } catch (e) {
      throw Exception('Failed to fetch students: $e');
    }
  }

  // Get a student by ID
  Future<Response> getStudentById(String studentId) async {
    try {
      Response response = await _dio.get('/students/$studentId');
      return response;
    } catch (e) {
      throw Exception('Failed to fetch student: $e');
    }
  }

  // Update a student
  Future<Response> updateStudent(
      {required String studentId, required Map<String, dynamic> data}) async {
    try {
      Response response = await _dio.put('/students/$studentId', data: data);
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

  // Update a student's preferred location
  Future<Response> updatePreferredLocation(
      {required String studentId, required String preferredLocation}) async {
    try {
      Response response = await _dio.put(
        '/students/$studentId/location',
        data: {'preferred_location': preferredLocation},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to update preferred location: $e');
    }
  }

  // Update a student's GRE score
  Future<Response> updateGreScore(
      {required String studentId, required int greScore}) async {
    try {
      Response response = await _dio.put(
        '/students/$studentId/gre',
        data: {'gre_score': greScore},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to update GRE score: $e');
    }
  }

  // Update a student's TOEFL score
  Future<Response> updateToeflScore(
      {required String studentId, required int toeflScore}) async {
    try {
      Response response = await _dio.put(
        '/students/$studentId/toefl',
        data: {'toefl_score': toeflScore},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to update TOEFL score: $e');
    }
  }

  // ----- Funding API ----- //

  // Create Funding
  Future<Map<String, dynamic>> createFunding(
      Map<String, dynamic> fundingData) async {
    try {
      final response = await _dio.post('/funding', data: fundingData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Get All Funding
  Future<List<dynamic>> getAllFunding() async {
    try {
      final response = await _dio.get('/funding');
      return response.data;
    } catch (e) {
      return [
        {'error': e.toString()}
      ];
    }
  }

  // Get Funding by University ID
  Future<Map<String, dynamic>> getFundingByUniversityId(
      String universityId) async {
    try {
      final response = await _dio.get('/funding/$universityId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Update Funding
  Future<Map<String, dynamic>> updateFunding(
      String fundingId, Map<String, dynamic> updatedData) async {
    try {
      final response = await _dio.put('/funding/$fundingId', data: updatedData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Delete Funding
  Future<Map<String, dynamic>> deleteFunding(String fundingId) async {
    try {
      final response = await _dio.delete('/funding/$fundingId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // ----- Program API ----- //

  // Create Program
  Future<Map<String, dynamic>> createProgram(
      Map<String, dynamic> programData) async {
    try {
      final response = await _dio.post('/programs', data: programData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Get All Programs
  Future<List<dynamic>> getAllPrograms() async {
    try {
      final response = await _dio.get('/programs');
      return response.data;
    } catch (e) {
      return [
        {'error': e.toString()}
      ];
    }
  }

  // Get Programs by University ID
  Future<Map<String, dynamic>> getProgramsByUniversityId(
      String universityId) async {
    try {
      final response = await _dio.get('/programs/$universityId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Update Program
  Future<Map<String, dynamic>> updateProgram(
      String programId, Map<String, dynamic> updatedData) async {
    try {
      final response =
          await _dio.put('/programs/$programId', data: updatedData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Delete Program
  Future<Map<String, dynamic>> deleteProgram(String programId) async {
    try {
      final response = await _dio.delete('/programs/$programId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // ----- Admissions API ----- //

  // Create an admission
  Future<Map<String, dynamic>> createAdmission(
      Map<String, dynamic> admissionData) async {
    try {
      final response = await _dio.post('/admissions', data: admissionData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Get all admissions
  Future<List<dynamic>> getAllAdmissions() async {
    try {
      final response = await _dio.get('/admissions');
      return response.data;
    } catch (e) {
      return [
        {'error': e.toString()}
      ];
    }
  }

  // Get an admission by ID
  Future<Map<String, dynamic>> getAdmissionById(String admissionId) async {
    try {
      final response = await _dio.get('/admissions/$admissionId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Update an admission
  Future<Map<String, dynamic>> updateAdmission(
      String admissionId, Map<String, dynamic> updatedData) async {
    try {
      final response =
          await _dio.put('/admissions/$admissionId', data: updatedData);
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // Delete an admission
  Future<Map<String, dynamic>> deleteAdmission(String admissionId) async {
    try {
      final response = await _dio.delete('/admissions/$admissionId');
      return response.data;
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  // ----- Rankings API ----- //

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
