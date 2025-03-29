Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4791C36011
	for <linux-i3c@archiver.kernel.org>; Sat, 29 Mar 2025 09:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kEpBw//BKJVdF2DBwWkkogzk6dc4oGJ7WCg7+JjdXM=; b=BrqOuoSmZOp3Pc
	FEYJiQTLh2M+9Tnqkx2peBOAoHGTZZ0k61Rk/HnePLzRVvhytRIlIOUqlMXsLUgDT5+aMiN+CZa+Y
	+ITlLrKArz3ezwOPGURCghdx5P6wL2oCpGR8mAv0a7v4TOOELJVI/LFJRXgukYuYu5FP1BMuh2z3D
	ihsOQ3n1PFs5UpLFargoR6Kas12j5jcek1B6nkvGhRenzJ7OXLuJOOgjuC7DaSIS2ZifnzB7tgLlb
	Y0G/5Zf/49PQ186LQEW6d+Pg1yOCsuXz7HBxGZIJL6t/i0o4kTr+kcfokjqhQ5UfFysR6xC8PrJtv
	a831PRMoxFsfPhqDLDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tySBe-0000000ExaG-1A2L;
	Sat, 29 Mar 2025 09:09:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tySBc-0000000ExZs-0KAJ
	for linux-i3c@lists.infradead.org;
	Sat, 29 Mar 2025 09:09:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52T7iR16014825;
	Sat, 29 Mar 2025 09:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXKkzX9mErv+JTwJzYqoSC+oddzi1P03gwtR3Y540f4=; b=cGjRwBM+qPOY6z5L
	kn2EG7HgLQMtGiR+INc9r8dsWY3xKoE/fdJo5zq4rjiABW5KG6Elagmt4iN1Qt0u
	cjCDfGI9DuL/ukufqsZdK4C/wquGMH5WaELR1G1Tea1m1ZLJKSIQVaON3dssss/a
	Y/u1TK6rA89P8mE5NIuXzvxwEzRoQei28P5UgfHl8R/uGaCaXbnyaL7VO0fI2H2Y
	VhW8m0HNVaGMU7ieWaFktAyvlESI6vwgZmQl3jjujFg7ApC208ioznVzGriOpVTH
	28xfFVzbAh4M12PRdD50RdtiXDzvQQDUZokolQtvU6vW++FNPvS2QGZ9FXu1du81
	icPG3A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1nrawj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 09:08:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52T98LSj017793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Mar 2025 09:08:21 GMT
Received: from [10.216.2.59] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 29 Mar
 2025 02:08:17 -0700
Message-ID: <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
Date: Sat, 29 Mar 2025 14:38:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 2/3] i3c: master: Add Qualcomm I3C controller driver
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
 <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
 <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eYBjDdDYgkLTx7i17GLHH1CBL8Dd05E2
X-Proofpoint-GUID: eYBjDdDYgkLTx7i17GLHH1CBL8Dd05E2
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67e7b8ab cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=0umaHvM9SrpUm-h6xacA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503290064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_020904_121976_6DFF3231 
X-CRM114-Status: UNSURE (   6.60  )
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

SGkgTWFya3VzLAoKT24gMy8yOS8yMDI1IDEyOjM0IEFNLCBNYXJrdXMgRWxmcmluZyB3cm90ZToK
Pj4+IFVuZGVyIHdoaWNoIGNpcmN1bXN0YW5jZXMgd291bGQgeW91IGJlY29tZSBpbnRlcmVzdGVk
IHRvIGFwcGx5IGEgc3RhdGVtZW50Cj4+PiBsaWtlIOKAnGd1YXJkKHNwaW5sb2NrX2lycXNhdmUp
KCZnaTNjLT5pcnFfbG9jayk74oCdPwo+PiBEaWRuJ3QgZ2V0LCBoZW5jZSBhIHF1ZXN0aW9uLsKg
IERvIHlvdSBzdWdnZXN0IHRvIHVzZSBERUZJTkVfTE9DS19HVUFSRF8xIGluc3RlYWQgb2YgZXhp
c3RpbmcgbWV0aG9kID8KPiBJIHByb3Bvc2UgdG8gcGljayBmdXJ0aGVyIG9wcG9ydHVuaXRpZXMg
dXAgZm9yIGJlbmVmaXRzIGZyb20gc2NvcGUtYmFzZWQgcmVzb3VyY2UgbWFuYWdlbWVudC4KPiAK
U29ycnksIHN0aWxsIG5vdCBjbGVhciB0byBtZSB3aGF0IHNob3VsZCBpIGFkZC9jaGFuZ2UgPyBw
bGVhc2Ugc2hhcmUgbWUgCnNvbWUgZXhhbXBsZS4KPiBSZWdhcmRzLAo+IE1hcmt1cwoKCi0tIAps
aW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
