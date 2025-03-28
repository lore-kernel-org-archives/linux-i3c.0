Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCDDC36014
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Mar 2025 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFJ7JcUgCmQNiqr04xUdVjgndnByY/o0ZAiGZ7PmPpk=; b=pVYAV5yY1aItG8
	4yHbzojRdzoXcOxB/thU/I780GCHD7Vtc5xg2AGXBqgCWTmXM9QPqmNBdlr+DNlrXF+hCsQo68bNL
	CVCzBfo4j/KQxrl7YQ7spRujIzzrOvaMjY7bun9tmWKu9J5Hwhq8jJryvKMunzkOulLJN3Dn5Xu15
	EAAqcPG7VWT6La0ltr2fzn8eQUxCboXFvRbQC9RgIupY2CG7yNoHc8x8QaCkoNM+eNiIvOaI2zWS1
	RubWf2rcHgWjh/MEnS3w7kFiSk0uLypM9msfs8KghDT0w2qSwcMu9w0hBWKbIZK9zsRNANmqdPY2r
	70GHhVlwmAzM2+48tJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyB9J-0000000Dfqo-2x2q;
	Fri, 28 Mar 2025 14:57:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAiW-0000000DbTx-3n0F
	for linux-i3c@lists.infradead.org;
	Fri, 28 Mar 2025 14:29:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S854Nh011163;
	Fri, 28 Mar 2025 14:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2ZeZUzTk5a04ubvS8T+jiIL1tuL9iQXCN7CriC5p+A=; b=HX7LarGh0076PUB4
	9Jmtro+Hq0B6flLszL7NxMtfbzgDS/coHDXnFqsWudiZBtdbsrxW2p59uxoaLQiZ
	q2b+S1YX0UqRx4DF4p8aCDCyWd8xLy+sV3C/5sku4853DzVKY5+Czudvxc615pJI
	MNJpFazZLp3bo1vUqAD7saCrhVA8tXXPaNNqQ3eADDNQkFg4qOnbbZ3QiSNjXk6e
	6LbgjHxCmKCQNV5GvXdcJKTvcf8autmV4yoOoNt8UrwpY0ImRuDutDzUcVK338fq
	uOs8IxhXa1gYtdywYxLX6EczE2l0Xey6RrTd8wY5A9BVOG8+OzMVbNZEy61jGKTv
	tKL2LA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nqxuh523-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:29:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52SETmcF012836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 14:29:48 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 07:29:44 -0700
Message-ID: <172b9848-0af6-44fc-83c2-8d2b94b74d51@quicinc.com>
Date: Fri, 28 Mar 2025 19:59:44 +0530
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
 <06545fa2-7f82-4154-a882-faddb53df4d9@web.de>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <06545fa2-7f82-4154-a882-faddb53df4d9@web.de>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VSxSHSvFQRNvTX_tHRLOmTT2ShDwNYhA
X-Authority-Analysis: v=2.4 cv=e7QGSbp/ c=1 sm=1 tr=0 ts=67e6b25c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=kyHiy3vJXLV0Zq-jrsYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: VSxSHSvFQRNvTX_tHRLOmTT2ShDwNYhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_07,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=972 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_072952_945128_651F5135 
X-CRM114-Status: UNSURE (   8.67  )
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

SGkgTWFya3VzLCBUaGFua3MgZm9yIHJldmlldyAhCgpPbiAzLzI4LzIwMjUgNjo1OCBQTSwgTWFy
a3VzIEVsZnJpbmcgd3JvdGU6Cj4g4oCmCj4+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9xY29t
LWkzYy1tYXN0ZXIuYwo+PiBAQCAtMCwwICsxLDExMDcgQEAKPiDigKYKPj4gKy8qIE1fQ01EIE9Q
IGNvZGVzIGZvciBJMkMvSTNDICovCj4+ICsjZGVmaW5lIEkzQ19SRUFEX0lCSV9IVyAgICAgICAg
ICAwCj4+ICsjZGVmaW5lIEkyQ19XUklURSAgICAgICAgICAgICAgICAxCj4+ICsjZGVmaW5lIEky
Q19SRUFEICAgICAgICAgICAgICAgICAyCj4g4oCmCj4gCj4gQ2FuIGFuIGVudW1lcmF0aW9uIGJl
Y29tZSBoZWxwZnVsIGhlcmU/Cj4gCk5vLCB0aGVzZSBhcmUgaGFyZHdhcmUgcHJvZ3JhbSBkZWZp
bmVkIG9wLWNvZGVzIG5vdCBjcmVhdGVkIGZvciBhbnkgCnNvZnR3YXJlIHB1cnBvc2UuIHNvIE1h
Y3JvIGRlZmluZSBsb29rcyBmaW5lIHRvIG1lLgo+IFJlZ2FyZHMsCj4gTWFya3VzCgoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
