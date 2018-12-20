package com.neusoft.domain;

import java.util.Date;

public class UserMessage {
    private Integer id;

    private Integer triggerMsgUserId;

    private Integer recvMsgUserId;

    private Integer topicId;

    private Integer msgType;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTriggerMsgUserId() {
        return triggerMsgUserId;
    }

    public void setTriggerMsgUserId(Integer triggerMsgUserId) {
        this.triggerMsgUserId = triggerMsgUserId;
    }

    public Integer getRecvMsgUserId() {
        return recvMsgUserId;
    }

    public void setRecvMsgUserId(Integer recvMsgUserId) {
        this.recvMsgUserId = recvMsgUserId;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public Integer getMsgType() {
        return msgType;
    }

    public void setMsgType(Integer msgType) {
        this.msgType = msgType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}