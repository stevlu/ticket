package com.stevlu.mapper;

import org.apache.ibatis.annotations.Param;

import com.stevlu.bean.JobLevel;

import java.util.List;

/**
 * Created by Steven Lu on 2018/11/21.
 */
public interface JobLevelMapper {
	JobLevel getJobLevelByName(String name);

	int addJobLevel(@Param("jobLevel") JobLevel jobLevel);

	List<JobLevel> getAllJobLevels();

	int deleteJobLevelById(@Param("ids") String[] ids);

	int updateJobLevel(@Param("jobLevel") JobLevel jobLevel);
}
