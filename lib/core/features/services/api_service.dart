import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:5000/api', // For Android Emulator
    ),
  );

  // Create a student
  Future<Response> createStudent({required Map<String, dynamic> data}) async {
    try {
      Response response = await _dio.post('/students', data: data);
      return response;
    } catch (e) {
      throw Exception('Failed to create student: $e');
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
      String studentId, Map<String, dynamic> data) async {
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

  // Create Funding
  Future<Map<String, dynamic>> createFunding(
      Map<String, dynamic> fundingData) async {
    try {
      final response = await _dio.post('/funding', data: fundingData);
      return response.data; // Return the response body
    } catch (e) {
      return {'error': e.toString()}; // Handle errors
    }
  }

  // Get All Funding
  Future<List<dynamic>> getAllFunding() async {
    try {
      final response = await _dio.get('/funding');
      return response.data; // Return the funding list
    } catch (e) {
      return [
        {'error': e.toString()}
      ]; // Handle errors
    }
  }

  // Get Funding by University ID
  Future<Map<String, dynamic>> getFundingByUniversityId(
      String universityId) async {
    try {
      final response = await _dio.get('/funding/$universityId');
      return response.data; // Return the funding data for the given university
    } catch (e) {
      return {'error': e.toString()}; // Handle errors
    }
  }

  // Update Funding
  Future<Map<String, dynamic>> updateFunding(
      String fundingId, Map<String, dynamic> updatedData) async {
    try {
      final response = await _dio.put('/funding/$fundingId', data: updatedData);
      return response.data; // Return the updated funding data
    } catch (e) {
      return {'error': e.toString()}; // Handle errors
    }
  }

  // Delete Funding
  Future<Map<String, dynamic>> deleteFunding(String fundingId) async {
    try {
      final response = await _dio.delete('/funding/$fundingId');
      return response.data; // Return the deletion result
    } catch (e) {
      return {'error': e.toString()}; // Handle errors
    }
  }

  // Create Program
  Future<Map<String, dynamic>> createProgram(
      Map<String, dynamic> programData) async {
    try {
      final response = await _dio.post('/programs', data: programData);
      return response.data; // Return the response body
    } catch (e) {
      return {'error': e.toString()}; // Handle errors
    }
  }

  // Get All Programs
  Future<List<dynamic>> getAllPrograms() async {
    try {
      final response = await _dio.get('/programs');
      return response.data; // Return the programs list
    } catch (e) {
      return [
        {'error': e.toString()}
      ]; // Handle errors
    }
  }

  // Get Programs by University ID
  Future<Map<String, dynamic>> getProgramsByUniversityId(
      String universityId) async {
    try {
      final response = await _dio.get('/programs/$universityId');
      return response.data; // Return the programs data for the given university
    } catch (e) {
      return {'error': e.toString()}; // Handle errors
    }
  }

  // Update Program
  Future<Map<String, dynamic>> updateProgram(
      String programId, Map<String, dynamic> updatedData) async {
    try {
      final response =
          await _dio.put('/programs/$programId', data: updatedData);
      return response.data; // Return the updated program data
    } catch (e) {
      return {'error': e.toString()}; // Handle errors
    }
  }

  // Delete Program
  Future<Map<String, dynamic>> deleteProgram(String programId) async {
    try {
      final response = await _dio.delete('/programs/$programId');
      return response.data; // Return the deletion result
    } catch (e) {
      return {'error': e.toString()}; // Handle errors
    }
  }
}
