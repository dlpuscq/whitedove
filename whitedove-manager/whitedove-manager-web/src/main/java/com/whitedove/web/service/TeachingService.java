package com.whitedove.web.service;

import com.whitedove.common.pojo.EUTreeNode;
import com.whitedove.common.utils.WhiteDoveResult;

import java.util.List;

public interface TeachingService {
    List<EUTreeNode> getTeachingList(long parentId);
    WhiteDoveResult insertTeaching(long parentId, String name);
    WhiteDoveResult deleteTeaching(long parentId, Long id);
    WhiteDoveResult updateTeaching(long id, String name);
}
