package com.mrms.conf.summary.service;


import com.mrms.conf.summary.domain.ConfSummary;

import java.util.List;

public interface IConfSummaryService {
    void create(ConfSummary summary);

    void delete(String id);

    void update(ConfSummary summary);

    ConfSummary get(String id);

    List<ConfSummary> list();
}
