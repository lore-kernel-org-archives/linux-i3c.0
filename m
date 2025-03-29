Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5ACC36008
	for <linux-i3c@archiver.kernel.org>; Sat, 29 Mar 2025 14:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9pL4P7vhz8g5SYKx9DFta2I2QZTjw6JB8Hlwgv82sw=; b=DSnfD1vXHBM8Ep
	EgtOTTlpkMX4MY/OPo6yGZIwLOfvvpSy/50x+M37M2hqwfPRY3HN7BZI26lWUN4ajGze9DsyVwe68
	hfy4w0pWfRs1ZzL/LbFYRj510KKJG2vPWHUX8mgDGGwc+U7ENOFAm4lnS1OqUrLd49f+0PWGuhQKb
	4pw3vQphMPhXyO+BrvZQfFzSYHvnzuguvPqBl7U3Ay658Qhdlfaae/0/jTUIEudwKSCKaF3C2u7h9
	3PVi0W9++uA7zSRMsvSDL8h0yWoYn2ae/OcvAkdVaNV8RicrEBcnp6RlNIA40GKXuLwvBj09mPnzR
	mmWVv0NbUsdVGqax9KjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyX9v-0000000FE7t-1b2X;
	Sat, 29 Mar 2025 14:27:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyX9s-0000000FE7K-216q
	for linux-i3c@lists.infradead.org;
	Sat, 29 Mar 2025 14:27:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52T7idao003693;
	Sat, 29 Mar 2025 14:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uq4Et5owwwGRm0Vo/rx1V2Z7yc/0t/O17YBf+POMpnA=; b=i0xkoFEiSm8RTLNS
	0bVkPnUWuYgPPZXP4lFmVg8fNeLMXISriAX5cEor61W1WWLOmJZJ2louub5mGfDK
	OuFLhKDOLqwoVN7KH1we1VDtuSVAcyqNf2JUe+0BywEENi80A9cPPqkiqIz1fvoG
	4v4WC0h8pVzo48R8Z+7zFk8oA1XCJPMqGaHhDAGXR3YNOeLVmREM8536xtSmZox6
	khk6l61x6+baVILQVi5CAhUxs8uTVACNd7ZDIYhLcrT2wZ2rGcQjgjQNXLQg6Ld1
	MxteQsvYBx3xD8gYgWf6MXOe1PjkW7ppmjprBNsGYCNR6HFJc43DhK+ZWuz9wCtW
	O9b6Sw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935rvbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 14:27:30 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52TERTAY024929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 14:27:29 GMT
Received: from [10.216.2.59] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 29 Mar
 2025 07:27:25 -0700
Message-ID: <3d6738cf-fc4c-4bc6-b986-9a647867e76f@quicinc.com>
Date: Sat, 29 Mar 2025 19:57:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Markus Elfring <Markus.Elfring@web.de>, <linux-i3c@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        LKML
	<linux-kernel@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
 <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
 <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
 <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
 <20250329104812225f9ee5@mail.local>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250329104812225f9ee5@mail.local>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LyoDU4ZznexULVx21UNS5ehTd9SHm9UF
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67e80352 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=X0vEURnw2XWclHXbzQYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LyoDU4ZznexULVx21UNS5ehTd9SHm9UF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503290104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_072736_534244_53F8ACD9 
X-CRM114-Status: UNSURE (   8.12  )
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

CgpPbiAzLzI5LzIwMjUgNDoxOCBQTSwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6Cj4gT24gMjkv
MDMvMjAyNSAxNDozODoxNCswNTMwLCBNdWtlc2ggS3VtYXIgU2F2YWxpeWEgd3JvdGU6Cj4+IEhp
IE1hcmt1cywKPj4KPj4gT24gMy8yOS8yMDI1IDEyOjM0IEFNLCBNYXJrdXMgRWxmcmluZyB3cm90
ZToKPj4+Pj4gVW5kZXIgd2hpY2ggY2lyY3Vtc3RhbmNlcyB3b3VsZCB5b3UgYmVjb21lIGludGVy
ZXN0ZWQgdG8gYXBwbHkgYSBzdGF0ZW1lbnQKPj4+Pj4gbGlrZSDigJxndWFyZChzcGlubG9ja19p
cnFzYXZlKSgmZ2kzYy0+aXJxX2xvY2spO+KAnT8KPj4+PiBEaWRuJ3QgZ2V0LCBoZW5jZSBhIHF1
ZXN0aW9uLsKgIERvIHlvdSBzdWdnZXN0IHRvIHVzZSBERUZJTkVfTE9DS19HVUFSRF8xIGluc3Rl
YWQgb2YgZXhpc3RpbmcgbWV0aG9kID8KPj4+IEkgcHJvcG9zZSB0byBwaWNrIGZ1cnRoZXIgb3Bw
b3J0dW5pdGllcyB1cCBmb3IgYmVuZWZpdHMgZnJvbSBzY29wZS1iYXNlZCByZXNvdXJjZSBtYW5h
Z2VtZW50Lgo+Pj4KPj4gU29ycnksIHN0aWxsIG5vdCBjbGVhciB0byBtZSB3aGF0IHNob3VsZCBp
IGFkZC9jaGFuZ2UgPyBwbGVhc2Ugc2hhcmUgbWUgc29tZQo+PiBleGFtcGxlLgo+IAo+IERvbid0
IGNoYW5nZSBhbnl0aGluZywgTWFya3VzIGlzIHdhc3RpbmcgeW91ciB0aW1lLgpDbGVhciB0byBt
ZS4gVGhhbmtzIGEgbG90ICEKPiAKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
