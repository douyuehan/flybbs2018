package com.neusoft.mapper;

import com.neusoft.domain.UserCollectTopic;

import java.util.List;
import java.util.Map;

public interface UserCollectTopicMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserCollectTopic record);

    int insertSelective(UserCollectTopic record);

    UserCollectTopic selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserCollectTopic record);

    int updateByPrimaryKey(UserCollectTopic record);

    int getIsCollectInfo(Map<String,Integer> map);
    int delCollectInfo(Map<String,Integer> map);

    List<Map<String,Object>> getCollectionsByUserID(int userid);
    int getCollectNumByUserID(int userid);
}