Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3D5C7EE39
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 00:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1teMbuOvyKFqAVmMopDrNbH44DFgkWSXGobJwBRcrw=; b=enzXqNf/p/msyB
	p6nTaITf+aS8WUB3MboJm9qGZNDu3yscXGWiqkI24KagZsfaOAaQUo84j3IaWMtdTBuqFhKYOHRhf
	S5PkCS+rRqoStVBFyjzb9xMSA5NZuh/FST3anEJXkljSZQmJgRwcJ9iTPis1W4BIiQxbs5S+7uHDf
	tFxaVOdOeUkn69rIi/ZCYIz5GnBbWPTe5O1I6ywpyJpRxgAG5HiULbaaiAxDXg+3tfrKIexaXaH3G
	i4RVJAcpf/TdJfnOORf4JkHKibCsKv8Zok8bu/OvJFXDl46MNnksi8WGdJaWISAl546qwTG4wWt1x
	2QEOo119qPiZxVC8GPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrYo-00000004Eg2-1m1U;
	Tue, 24 Jun 2025 00:30:50 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNX1F-00000000KSh-2rwT
	for linux-i3c@lists.infradead.org;
	Fri, 06 Jun 2025 13:22:03 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556AVV6v023288;
	Fri, 6 Jun 2025 09:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=vUOoO
	fDlzVwDstDNQmrOAz1FyWVCQ/REQ3X9anjHVPY=; b=DHlw2z/9rjOsx6Hs3hH8z
	e4aw22LBvxyxbgwXZ8nlz0ZX1ENyB+U0G1gOEFUaZfFihjNIl6g7TW/aOx9klRXu
	Dqtz7Xg96SYjX74dI16wOgi/3ZuJ1V6l5HAoJ35MlljJXvMEKch+Xq8R9Ncd9QkS
	qDVVc++e5bKAUr7nUy4bpP4AZ/zNi9BZ6OnhFNKQhHRaaRP3CFboW9l53kLhHC6c
	AgCSFgJSR/ysFRF2SpBgSBJIpfwJdCaUwAXOw6pjdnnotF/XFWf2Oc3dZiat/NxI
	sTXTux7qT8Ytr9JM7tBVx9mCaqKp4sI7uY7cAiNdMalWxMeCgvqq6oy/Z8xR+OLd
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 472k2ucax0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 09:21:49 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 556DLlIG061996
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Jun 2025 09:21:47 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Jun
 2025 09:21:47 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Jun 2025 09:21:47 -0400
Received: from [127.0.1.1] ([10.44.3.40])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 556DLYfh019626;
	Fri, 6 Jun 2025 09:21:41 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Fri, 6 Jun 2025 15:21:02 +0200
Subject: [PATCH v2 1/2] dt-bindings: i3c: Add adi-i3c-master
MIME-Version: 1.0
Message-ID: <20250606-adi-i3c-master-v2-1-e68b9aad2630@analog.com>
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
In-Reply-To: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749216066; l=2716;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=4lfqDinsst5rxiSPQwy+MHQH7sSvuercecpUyNyRXKg=;
 b=VRfb5ad1fsO2UimjJwuFb6kXNncZyO1T4JI0ATd1fxCfVsnyQONk9K624h4+8S4Z4S9TLTInk
 HI6ZMbDwKBWCrV4setzCV62yHy+aIV2ctCAOoJdmIqMLYBcd1ukcQIl
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: yN3oVh1gKricR2O7e8ib3HfbFIcQYaKc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEyMSBTYWx0ZWRfX19JOc7qrNTjW
 1P00HD3W/gGJRRQa6QMY9//qk9YtQIUBKACqgwrTDPZw3Z6TxW3WbF6/IOzqiCgm5LDmdU9c6JZ
 Lf520ZAC+8aldlN89ogyndfAY12d/2FlRCvhHZNk/25wL6WQih5lWjBJCapiFBugveB26KFJeKS
 G+18LtN5N12WF8kTXqNU7xzGuvdytPOTxDwPAevyaQsx2SQPeJUqAgrKrLWjtFwOkWX+aY07eXk
 U26tJo2XFtxYyfKDQ9KeMgKS3hnzFRlmRyTKgctFgALBvccOfKwYIuPOhHsTnlIz00L67TfP8j1
 Hnf0tVtTr77XaWxYotYsjfSBy9A+fcvbOndCE7AIqZWXXm4b1vOJ13mUheeH09qNn1i0z4sxhqi
 KWjUhbQ3HrFdmPnjfLstzppW5cxf/7/9x+GW1FBaWlctQ9Me0q2Vt13iL/zuMVgraQc/DP8R
X-Proofpoint-ORIG-GUID: yN3oVh1gKricR2O7e8ib3HfbFIcQYaKc
X-Authority-Analysis: v=2.4 cv=Fv4F/3rq c=1 sm=1 tr=0 ts=6842eb6d cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=BiVzJI_yISUpa7ZiZSMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=861 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_062201_733359_CE42FE7F 
X-CRM114-Status: GOOD (  14.33  )
X-Mailman-Approved-At: Mon, 23 Jun 2025 15:46:41 -0700
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

QWRkIGJpbmRpbmdzIGRvYyBmb3IgQURJIEkzQyBDb250cm9sbGVyIElQIGNvcmUsIGEgRlBHQSBz
eW50aGVzaXphYmxlIElQCmNvcmUgdGhhdCBpbXBsZW1lbnRzIHRoZSBNSVBJIEkzQyBCYXNpYyBj
b250cm9sbGVyIHNwZWNpZmljYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKb3JnZSBNYXJxdWVzIDxq
b3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTNj
L2FkaSxpM2MtbWFzdGVyLnlhbWwgICAgfCA2MyArKysrKysrKysrKysrKysrKysrKysrCiBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrCiAy
IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMC4uZTdmYWUzOTRhZDhmZDQxNDNlYjFmZmZiOTU5MWEzMGEyZDZjYzZhYwotLS0gL2Rldi9u
dWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1t
YXN0ZXIueWFtbApAQCAtMCwwICsxLDYzIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbCMKKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTog
QW5hbG9nIERldmljZXMgSTNDIENvbnRyb2xsZXIKKworZGVzY3JpcHRpb246IHwKKyAgVGhlIEFE
SSBJM0MgY29udHJvbGxlciBpbXBsZW1lbnRzIGEgc3Vic2V0IG9mIHRoZSBJM0MtYmFzaWMgc3Bl
Y2lmaWNhdGlvbiB0bworICBpbnRlcmZhY2UgSTNDIGFuZCBJMkMgcGVyaXBoZXJhbHMgWzFdLgor
CisgIFsxXSBodHRwczovL2FuYWxvZ2RldmljZXNpbmMuZ2l0aHViLmlvL2hkbC9saWJyYXJ5L2kz
Y19jb250cm9sbGVyCisKK21haW50YWluZXJzOgorICAtIEpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1h
cnF1ZXNAYW5hbG9nLmNvbT4KKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBjb25z
dDogYWRpLGkzYy1tYXN0ZXIKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9ja3M6
CisgICAgbWluSXRlbXM6IDEKKyAgICBpdGVtczoKKyAgICAgIC0gZGVzY3JpcHRpb246IFRoZSBB
WEkgaW50ZXJjb25uZWN0IGNsb2NrLgorICAgICAgLSBkZXNjcmlwdGlvbjogVGhlIEkzQyBjb250
cm9sbGVyIGNsb2NrLgorCisgIGNsb2NrLW5hbWVzOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25z
dDogYXhpCisgICAgICAtIGNvbnN0OiBpM2MKKworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0ZW1z
OiAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBjbG9ja3MKKyAg
LSBjbG9jay1uYW1lcworICAtIGludGVycnVwdHMKKworYWxsT2Y6CisgIC0gJHJlZjogaTNjLnlh
bWwjCisKK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAor
ICAgIGkzY0A0NGEwMDAwMCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGkzYy1tYXN0ZXIi
OworICAgICAgICByZWcgPSA8MHg0NGEwMDAwMCAweDEwMDA+OworICAgICAgICBpbnRlcnJ1cHRz
ID0gPDAgNTYgND47CisgICAgICAgIGNsb2NrcyA9IDwmY2xrYyAxNT4sIDwmY2xrYyAxNT47Cisg
ICAgICAgIGNsb2NrLW5hbWVzID0gImF4aSIsICJpM2MiOworICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwzPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisKKyAgICAgICAgLyogSTNDIGFu
ZCBJMkMgZGV2aWNlcyAqLworICAgIH07CmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5U
QUlORVJTCmluZGV4IDk2YjgyNzA0OTUwMTg0YmQ3MTYyM2ZmNDFmYzRkZjMxZTRjN2ZlODcuLjZm
NTZlMTdkY2VjZjkwMmM2ODEyODI3YzFlYzNlMDY3YzY1ZTk4OTQgMTAwNjQ0Ci0tLSBhL01BSU5U
QUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xMTI0Myw2ICsxMTI0MywxMSBAQCBTOglNYWlu
dGFpbmVkCiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FzcGVlZCxh
c3QyNjAwLWkzYy55YW1sCiBGOglkcml2ZXJzL2kzYy9tYXN0ZXIvYXN0MjYwMC1pM2MtbWFzdGVy
LmMKIAorSTNDIERSSVZFUiBGT1IgQU5BTE9HIERFVklDRVMgSTNDIENPTlRST0xMRVIgSVAKK006
CUpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNvbT4KK1M6CU1haW50YWluZWQK
K0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0ZXIu
eWFtbAorCiBJM0MgRFJJVkVSIEZPUiBDQURFTkNFIEkzQyBNQVNURVIgSVAKIE06CVByemVteXPF
gmF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KIFM6CU1haW50YWluZWQKCi0tIAoyLjQzLjAKCgot
LSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
