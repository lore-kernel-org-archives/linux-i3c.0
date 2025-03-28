Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC6BC36011
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Mar 2025 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCWqxSBtM54BNPer04XrKZHTAgtOg0nEuyGqOeRuGCg=; b=xYsenZ7iEpybdU
	UqlTH088AJKHcqJG9Wqt+ExQVmOiPMceWEsnHUQ/8dAuCx2x5b7ZT1HUDwaYSjWrPLwPJQGvwOTQd
	4XmOQCM4zKQ5tXck2rXDrCryQeVhvmePXQQrezG4ccxFQODrgZNt6RS5q7OZCTHFaIyLDE/d1fmvl
	Rp0qTjVU0chJ4bLQPdlgD485qFDL0aqP6iHtCOkvn/aigOPIae+eqnB63IDO0tqs8wBwzQhr9UhpR
	bLEeN/0KtYreAKE8tMR1V5Qma8PbMmAJM8ke8OaH1stbXmOq2jRkQRFtQJlbjX4r02VjRdses/XXS
	tmFQzXfx9dHifW6dPGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyB9J-0000000DfqX-135i;
	Fri, 28 Mar 2025 14:57:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAiO-0000000DbRz-3vuM
	for linux-i3c@lists.infradead.org;
	Fri, 28 Mar 2025 14:29:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S856HH011218;
	Fri, 28 Mar 2025 14:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6NGIQHY4CqP2+W4rV15kcCHVC1zi2EcPSvd5Z1AwSd0=; b=UW9FKCgJL5kkIYZF
	n5oj3AtSdAjSiJUXa4bN8JBZ+yaGEqIEUygGTtq2hXTl6YKD9wkrGklEhPLoE3GJ
	FjqyMDCzC+EehrtyUprAOdQrKgUH3ICkSZVHGvzIMqsEJ5v9oUEzSJ8z5sfT84P7
	6Aso+W+eNNOZS6ig3GSB3VZwtvu6JzXNnWmpanVCtYUbhXREqAxDAMZxotI98D4X
	y2OYdERVhwawaJW41hRJXE0fvke6ntNVj48hZbymH+LnYLroij2YGchB8eEizPzE
	fJ6YJHUycrMxbS71aJV1RvG5wZsRr0A48KfSr/ijY/XsCm3YYJfhWp+Ui6GQ0+Rh
	LPFaoQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nqxuh51s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:29:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52SETdD8012326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:29:39 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 07:29:36 -0700
Message-ID: <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
Date: Fri, 28 Mar 2025 19:59:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Markus Elfring <Markus.Elfring@web.de>, <linux-i3c@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jarkko Nikula
	<jarkko.nikula@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SrTjOU1G05fnxYXje6cxzk331-0KmyQh
X-Authority-Analysis: v=2.4 cv=e7QGSbp/ c=1 sm=1 tr=0 ts=67e6b254 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=P-IC7800AAAA:8 a=6vbhIhILFGkt50-TBsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: SrTjOU1G05fnxYXje6cxzk331-0KmyQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_07,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_072944_979288_710D0D5B 
X-CRM114-Status: UNSURE (   8.37  )
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

VGhhbmtzIE1hcmt1cyBmb3IgcmV2aWV3IGFuZCBzdWdnZXN0aW9uICEKCk9uIDMvMjgvMjAyNSA2
OjQ5IFBNLCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPiDigKYKPj4gKysrIGIvZHJpdmVycy9pM2Mv
bWFzdGVyL3Fjb20taTNjLW1hc3Rlci5jCj4+IEBAIC0wLDAgKzEsMTEwNyBAQAo+IOKApgo+PiAr
c3RhdGljIHZvaWQgZ2VuaV9pM2NfYWJvcnRfeGZlcihzdHJ1Y3QgZ2VuaV9pM2NfZGV2ICpnaTNj
KQo+PiArewo+IOKApgo+PiArCXNwaW5fbG9ja19pcnFzYXZlKCZnaTNjLT5pcnFfbG9jaywgZmxh
Z3MpOwo+PiArCWdlbmlfaTNjX2hhbmRsZV9lcnIoZ2kzYywgR0VOSV9USU1FT1VUKTsKPj4gKwln
ZW5pX3NlX2Fib3J0X21fY21kKCZnaTNjLT5zZSk7Cj4+ICsJc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSgmZ2kzYy0+aXJxX2xvY2ssIGZsYWdzKTsKPiDigKYKPiAKPiBVbmRlciB3aGljaCBjaXJjdW1z
dGFuY2VzIHdvdWxkIHlvdSBiZWNvbWUgaW50ZXJlc3RlZCB0byBhcHBseSBhIHN0YXRlbWVudAo+
IGxpa2Ug4oCcZ3VhcmQoc3BpbmxvY2tfaXJxc2F2ZSkoJmdpM2MtPmlycV9sb2NrKTvigJ0/CkRp
ZG4ndCBnZXQsIGhlbmNlIGEgcXVlc3Rpb24uICBEbyB5b3Ugc3VnZ2VzdCB0byB1c2UgREVGSU5F
X0xPQ0tfR1VBUkRfMSAKaW5zdGVhZCBvZiBleGlzdGluZyBtZXRob2QgPwo+IGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE0LXJjNi9zb3VyY2UvaW5jbHVkZS9saW51eC9zcGlu
bG9jay5oI0w1NzIKPiAKPiBSZWdhcmRzLAo+IE1hcmt1cwo+IAoKCi0tIApsaW51eC1pM2MgbWFp
bGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
