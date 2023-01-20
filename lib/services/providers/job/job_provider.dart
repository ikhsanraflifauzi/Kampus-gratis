import 'package:kampus_gratis/models/penyaluran_kerja/job_detail_model.dart';
import 'package:kampus_gratis/models/penyaluran_kerja/job_models.dart';
import 'package:kampus_gratis/services/repository/job/job_repository.dart';
import 'package:kampus_gratis/utils/typedef.dart';

class JobProvider {
  final JobRepository _jobRepository;
  JobProvider(this._jobRepository);
  Future<List<JobModels>?> getAll(JSON param) async {
    var response = await _jobRepository.allJobs(param);
    return Job.fromJson(response).data;
  }

  Future<DetailJobModel?> getJobDetail(String id) async {
    var response = await _jobRepository.jobDetail(id);
    return DetailJob.fromJson(response).data;
  }
}
