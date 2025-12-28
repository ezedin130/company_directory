import 'package:get/get.dart';
import '../model/company.dart';
import '../service/company_service.dart';

class CompanyController extends GetxController {
  final CompanyService _companyService = CompanyService();

  var companies = <Company>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
  }

  void fetchCompanies() async {
    try {
      isLoading.value = true;
      final fetchedCompanies = await _companyService.fetchCompanies();
      companies.assignAll(fetchedCompanies);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
