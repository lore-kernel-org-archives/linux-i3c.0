Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0DCC36017
	for <linux-i3c@archiver.kernel.org>; Mon, 31 Mar 2025 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55uD3921RUszIpPCv3tZtQydpP9aWeHUuFllDwcmPFo=; b=ZDR3Vchvm5qYRz
	aMeCfqPPDX+ae9tF09ao9l5cNSPQ8xBLoJd7Ylqs177VXEV1vK4xAS4SY4A+2Bgsn/mgR75RkqGqW
	XfgRGbEW7yHs72aTyGE3ZJ/4B99wZwHMwM7Mpmi3PJCg0h5vQFeM4Om9ytnLo+0LTMQdPB+elf7GP
	M+VS3dPeBADsEbFsYUNRuu9jxxUEFzF0Qik/yGJCKkqJY+KcEwydehpRTC4xPocaXJh5MQpQp8COK
	qCpZk69jOv7jJH+ZFDNBI5CdqSoEyWqUfIIb67l2whRDqpf2CIerMHQtEX+TS25jcppLwqG66tJ9O
	mmrjXbU4+2OH1RslvKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Ec-0000000HAEn-3Oif;
	Mon, 31 Mar 2025 07:07:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Ea-0000000HAER-34f1
	for linux-i3c@lists.infradead.org;
	Mon, 31 Mar 2025 07:07:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kcuv007217;
	Mon, 31 Mar 2025 07:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	22pAVRsd8PHlcilVo6JsAJE+xEez+n8nCt5fo3b0y1I=; b=MWW4bfBS8I81dl3h
	2pyrdHy1KwMOOeTYXezh3vF593cuFazh1aTI3htoW4Pi9PqsMVbSv8xE4whtK3H9
	hciwpVVR6E6LiT/+Ubzj0MzyTNdfL2VXln9F+x2/QwkJ4AbbvMKH4A14lMQYMBDg
	Zx18lmOIa39I3jviqRWW0uqT/rxceROtCQADIBp3xKLJ9rs7uofIFIklRwU+DAZA
	CfN8QHQDQolI4O5vvDWWrVDpSql6e/9oIJXzdFkS/6c/0xzCzBQxEWO3AyioR0sI
	NnZSQJEdriYS3Lc4VCCBy9hUNJNBe9lgUh6O0QB6lG3dhft90YBCTqBmjxvvazcy
	gdnmkQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9893rnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 07:06:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52V76q7K015747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 07:06:52 GMT
Received: from [10.216.38.66] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 00:06:48 -0700
Message-ID: <336dc6ad-6e9e-439d-b7c4-7fea1c5cd8e9@quicinc.com>
Date: Mon, 31 Mar 2025 12:36:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
 <20250326141641.3471906-2-quic_msavaliy@quicinc.com>
 <991b0652-76f2-40d6-b49b-1e6f76e254ac@kernel.org>
 <661e1a21-0f3a-497a-9b3b-fab284e30d19@quicinc.com>
 <36b67f9c-5905-4fa6-8190-ab980850b3a2@kernel.org>
 <e997bd15-728c-4316-8050-d461f115fd9f@quicinc.com>
 <04945ad2-1372-4c73-beae-fc6449fb9a76@kernel.org>
 <838dfc8d-24c3-4f03-9c24-863259bb22b1@quicinc.com>
 <b68559e6-fc2b-493b-9f37-3125ff924a65@kernel.org>
 <c6370b99-efde-46ab-a1a4-65b979ca2dfa@quicinc.com>
Content-Language: en-US
In-Reply-To: <c6370b99-efde-46ab-a1a4-65b979ca2dfa@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67ea3f0d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qDEyJHh0b9D76DOg5wAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sohM14mVqFSexODKJv_cmJzMVZqcEf-j
X-Proofpoint-ORIG-GUID: sohM14mVqFSexODKJv_cmJzMVZqcEf-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_000700_894762_2209A9A2 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CgpPbiAzLzMxLzIwMjUgMTI6MjIgUE0sIE11a2VzaCBLdW1hciBTYXZhbGl5YSB3cm90ZToKPiBU
aGFua3MgS3J6eXN6dG9mwqAgIQo+IAo+IE9uIDMvMzAvMjAyNSAzOjEyIFBNLCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOgo+PiBPbiAyOS8wMy8yMDI1IDE1OjMxLCBNdWtlc2ggS3VtYXIgU2F2
YWxpeWEgd3JvdGU6Cj4+PiBkdC1iaW5kaW5nIGZpbGUgbmFtZTogcWNvbSxpM2MtZ2VuaS1xY29t
LnlhbWwKPj4KPj4gTm8uIEkgYWxyZWFkeSBhc2tlZCB0byB1c2UgY29tcGF0aWJsZSBhcyBmaWxl
bmFtZS4gRG9uJ3QgY3JlYXRlIHlvdXIgb3duCj4+IHJ1bGVzLgo+Pgo+IG9rYXksIG5vIHByb2Js
ZW0uIEkgd2FzIHRyeWluZyB0byBmb2xsb3cgcHJldmlvdXMgaTJjLHNwaSwgc2VyaWFsIHVhcnQu
Cj4gTGV0IG1lIG1ha2UgYSBjbGVhbnVwIHBhdGNoIGZvciB0aGVtIGFsc28gbmV4dCBhcyBtZW50
aW9uZWQgZWFybGllci4KPiAKPiBGb3IgaTNjLCBjb21wYXRpYmxlIHdpbGwgYmUgImdlbmktaTNj
IiBhcyBzdWdnZXN0ZWQgYnkgeW91ICwgUm9iLgo+IGR0LWJpbmRpbmcgZmlsZW5hbWXCoCAicWNv
bSxpM2MtZ2VuaS55YW1sIiBPUiAicWNvbSxnZW5pLWkzYy55YW1sIiA/Cj4+PiBjb21wYXRpYmxl
ID0gInFjb20sZ2VuaS1pM2MiOwpQbGVhc2UgSWdub3JlIHByZXZpb3VzIGFzay4gSSB3aWxsIGdv
IHdpdGggZmlsZW5hbWUgPSBxY29tLGdlbmktaTNjLnlhbWwKCj4+Pj4KPj4+PiBCZXN0IHJlZ2Fy
ZHMsCj4+Pj4gS3J6eXN6dG9mCj4+Pgo+Pgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEtyenlzenRv
Zgo+IAo+IAoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
