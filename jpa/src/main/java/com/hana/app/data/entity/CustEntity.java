package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Builder
@Entity(name = "cust")
@Table(name = "db_cust")
@Getter
@ToString(exclude = "custAddrEntityList")
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class CustEntity {
    @Id
    @Column(name = "cust_id", length = 30)
    private String id;
    @Column(length = 60, nullable = false)
    private String pwd;
    @Column(length = 50, nullable = false)
    private String name;

    @OneToOne(mappedBy = "cust")
    private CustInfoEntity custInfo;

    @OneToMany(mappedBy = "cust", fetch = FetchType.EAGER)
    @Builder.Default
    private List<CustAddrEntity> custAddrEntityList = new ArrayList<>();
}
