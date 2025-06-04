Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38739C5AE59
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Jun 2025 09:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEdNdOR0fcJaoKhZhA9ts9eu6tuA+meEGwOq2sJnH94=; b=C6+STFTVapnB08
	YSCjN4G+NtYqPChLnaueIYdsz5XlJQQ2Xyr5IWagMPMZ9/bqkXopCdO3enpS4j9cM2s+1vXxHpYPr
	1U5MNG7poyrMUNxyiBDbA4WqBG/5MWZCm/G+mwJyxzZtgyHbmR37QshUuid70gT8xCgN7yWRVwWeQ
	TKtzsaUq2j38qAkSY/6773q4RAmbNaJvT2T/GsQXtr5An/svtl/ycqZANdy4sxqxoaGjsjokLVRW5
	lGv2Smq4xb53vr/D/IpVlQvSQSBrcGOUR1Ft40/W4x1Ixz5vvAwnVkM1ljBPi0+hIlRBhvtyt4LEc
	k7ijR3p5UKfX/js0dRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6h9-0000000F8wG-3vbn;
	Thu, 05 Jun 2025 09:15:31 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqMt-0000000DjhP-0cXQ
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 15:49:32 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554D4Mui023283;
	Wed, 4 Jun 2025 11:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=3Z7o8
	DM2qIcGBH62grXBsYITC2RBxzrsg0t1Sq/TSEY=; b=a0pcN45t2IpTqRNUiAcfz
	VDejd1XkAhS4Dg7RGIzHq+MHeU5WJrOBVGiVHjldQ+7wb8BSUBvKBPqIgrp3BArB
	ouSnb+h9lS7cFf84VA5fP833ygFlAzZPxUX+g0QGbv5frJ2rJkjCL5T+gWG4c0z2
	2F1E2BDlrnQZP1QRQt4mj3nRqtfLbZCao5KLFn9AWr59wTryAZBCgqDRyKEgJPLH
	3MjY6l+7cCCfcjdrH0ehEOw1s/V52j9WJk3UG0oz/lWLOdj//RCpJo/nC4dOQHKO
	9l2w7H3DKvhrFb8XIAxSTyxe3Dh9pQ3bBISUHuV4Fam0QkoGC484dIH7xZo3S52E
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 472k2u1w5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 11:49:20 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 554FnJYl020822
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Jun 2025 11:49:19 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 4 Jun
 2025 11:49:19 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 4 Jun 2025 11:49:19 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.51])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 554Fn5K4003109;
	Wed, 4 Jun 2025 11:49:13 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Wed, 4 Jun 2025 17:48:57 +0200
Subject: [PATCH 1/2] dt-bindings: i3c: Add adi-i3c-master
MIME-Version: 1.0
Message-ID: <20250604-adi-i3c-master-v1-1-0488e80dafcb@analog.com>
References: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
In-Reply-To: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749052145; l=2640;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=8mkPg7mEcrb8I75RjBz1Bmbnu3KCBCssH5QspO2gOFE=;
 b=1Fe2M4tiNDOHYQKgo8HJBDvfEaicq0YiWCDCn/VaB8HsAKk4jSx2YPaGOB5qf67w2KAE5ixAy
 UpVfv4mgg+LD1pEHqfJLF8zQFoakmh/fNr4KWVsOQo++yl/VHcmR0rS
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 4ObCpcVnM3lZjKqVXZ3WVNOdnGW3Mk0S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExOSBTYWx0ZWRfXwF00/Mx5s4Q2
 Yr6F3NZtlFGBSc98bSOOexvzLQfGpTZT4rByFgUUaxmMP8g85lnExO42ufP2w+IBX3/ROosrjwx
 2sFdynhwBTj2jA7DBuC42qToka4/9KQkH5rAG77U/CmIC31vU7hFJHV3ekqZKCQZUmKXxqjmxuN
 lG8a9ZrXIxLGynj/uBdiUbgk1amCy4sgnKD/j8rRrE3uVQnqnKE0iIya8Xeo7EwMPzANV0bV9WA
 NykyB22B4eNBsrISl6Dye4zBzJF8L2P0t511hQ94lTF7NIJCx+nTASbGnnecb6fN9+WdIXINc14
 q9P6p+gnR6SyJRVk25SCt+iUGIByZh+UqpHSFPTaqZHMNjIPO5g3DOALRJMJKPer7gQ07m9KvYz
 juO6BRTPYr4mltMMYNFE4IwMq3G3uegeZnVOR31a6SquiUzhJp1ck0Nbf/IjQdbMyyBL/2bk
X-Proofpoint-ORIG-GUID: 4ObCpcVnM3lZjKqVXZ3WVNOdnGW3Mk0S
X-Authority-Analysis: v=2.4 cv=Fv4F/3rq c=1 sm=1 tr=0 ts=68406b00 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=BiVzJI_yISUpa7ZiZSMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=967 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_084931_190479_4FDBB692 
X-CRM114-Status: GOOD (  15.19  )
X-Mailman-Approved-At: Thu, 05 Jun 2025 02:14:09 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

QWRkIG5vZGVzIGZvciBBREkgSTNDIENvbnRyb2xsZXIgSVAgY29yZS4KClNpZ25lZC1vZmYtYnk6
IEpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNvbT4KLS0tCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbCAgICB8IDYzICsrKysrKysrKysr
KysrKysrKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDUgKysKIDIgZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0
ZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1t
YXN0ZXIueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwLi44NTlkYmZkZTE1ZjEyM2RiNTlkN2FhNDZjMTIwYzRhM2Fj
MDUxOThlCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sCkBAIC0wLDAgKzEsNjMgQEAKKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKKyVZQU1MIDEuMgor
LS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2kzYy9hZGksaTNjLW1hc3Rl
ci55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjCisKK3RpdGxlOiBBbmFsb2cgRGV2aWNlcyBJM0MgQ29udHJvbGxlcgorCitkZXNjcmlw
dGlvbjogfAorICBUaGUgQURJIEkzQyBjb250cm9sbGVyIGltcGxlbWVudHMgYSBzdWJzZXQgb2Yg
dGhlIEkzQy1iYXNpYyBzcGVjaWZpY2F0aW9uIHRvCisgIGludGVyZmFjZSBJM0MgYW5kIEkyQyBw
ZXJpcGhlcmFscyBbMV0uCisKKyAgWzFdIGh0dHBzOi8vYW5hbG9nZGV2aWNlc2luYy5naXRodWIu
aW8vaGRsL2xpYnJhcnkvaTNjX2NvbnRyb2xsZXIKKworbWFpbnRhaW5lcnM6CisgIC0gSm9yZ2Ug
TWFycXVlcyA8am9yZ2UubWFycXVlc0BhbmFsb2cuY29tPgorCithbGxPZjoKKyAgLSAkcmVmOiBp
M2MueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogYWRpLGkz
Yy1tYXN0ZXIKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9ja3M6CisgICAgbWlu
SXRlbXM6IDEKKyAgICBpdGVtczoKKyAgICAgIC0gZGVzY3JpcHRpb246IFRoZSBBWEkgaW50ZXJj
b25uZWN0IGNsb2NrLgorICAgICAgLSBkZXNjcmlwdGlvbjogVGhlIEkzQyBjb250cm9sbGVyIGNs
b2NrLgorCisgIGNsb2NrLW5hbWVzOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogc19heGlf
YWNsaworICAgICAgLSBjb25zdDogaTNjX2NsaworCisgIGludGVycnVwdHM6CisgICAgbWF4SXRl
bXM6IDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGNsb2Nrcwor
ICAtIGNsb2NrLW5hbWVzCisgIC0gaW50ZXJydXB0cworCit1bmV2YWx1YXRlZFByb3BlcnRpZXM6
IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBpM2NANDRhMDAwMDAgeworICAgICAgICBj
b21wYXRpYmxlID0gImFkaSxpM2MtbWFzdGVyIjsKKyAgICAgICAgcmVnID0gPDB4NDRhMDAwMDAg
MHgxMDAwPjsKKyAgICAgICAgaW50ZXJydXB0cyA9IDwwIDU2IDQ+OworICAgICAgICBjbG9ja3Mg
PSA8JmNsa2MgMTU+LCA8JmNsa2MgMTU+OworICAgICAgICBjbG9jay1uYW1lcyA9ICJzX2F4aV9h
Y2xrIiwgImkzY19jbGsiOworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsKKyAgICAgICAg
I3NpemUtY2VsbHMgPSA8MD47CisKKyAgICAgICAgLyogSTNDIGFuZCBJMkMgZGV2aWNlcyAqLwor
ICAgIH07CmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDk2Yjgy
NzA0OTUwMTg0YmQ3MTYyM2ZmNDFmYzRkZjMxZTRjN2ZlODcuLjZmNTZlMTdkY2VjZjkwMmM2ODEy
ODI3YzFlYzNlMDY3YzY1ZTk4OTQgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5U
QUlORVJTCkBAIC0xMTI0Myw2ICsxMTI0MywxMSBAQCBTOglNYWludGFpbmVkCiBGOglEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FzcGVlZCxhc3QyNjAwLWkzYy55YW1sCiBG
Oglkcml2ZXJzL2kzYy9tYXN0ZXIvYXN0MjYwMC1pM2MtbWFzdGVyLmMKIAorSTNDIERSSVZFUiBG
T1IgQU5BTE9HIERFVklDRVMgSTNDIENPTlRST0xMRVIgSVAKK006CUpvcmdlIE1hcnF1ZXMgPGpv
cmdlLm1hcnF1ZXNAYW5hbG9nLmNvbT4KK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbAorCiBJM0MgRFJJVkVS
IEZPUiBDQURFTkNFIEkzQyBNQVNURVIgSVAKIE06CVByemVteXPFgmF3IEdhaiA8cGdhakBjYWRl
bmNlLmNvbT4KIFM6CU1haW50YWluZWQKCi0tIAoyLjQ5LjAKCgotLSAKbGludXgtaTNjIG1haWxp
bmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
