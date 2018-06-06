package com.whitedove.web.service;

import com.whitedove.common.pojo.EUDataGridResult;
import com.whitedove.common.utils.WhiteDoveResult;
import com.whitedove.pojo.TbCareer;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/31 8:28
 */
public interface JobService {

    EUDataGridResult getJobList(int page, int rows);
    WhiteDoveResult updateJob(TbCareer career)throws Exception;
    WhiteDoveResult addJob(TbCareer career)throws Exception;
    WhiteDoveResult deleteJobr(Integer id) throws Exception;
}
