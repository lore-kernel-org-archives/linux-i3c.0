Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45356C83029
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAo1/jxd0kAOmCJNN+G2y40FeflUfCcTKGIbIvRt78c=; b=VFvJphcXvfEUhh
	WWtWXhMUAMn0JrRHbUb55shJjuAAVk70lEOE7BL5ekh8rga+/yCRHHZLzw9/P6o/VnkAxmY3nSFFG
	A+qI5i6b1YWq3rZKTJj5Mkg4h8q/+6IbhmW9YZeFji6imrr6t8GHApIpvQpYSiY/86kV42x3Kukyw
	xXlSl/apN47RctLeZL1Q6h7kracEuCzhAAmQ5qihQeoJuT2Vrv43qvh58d2HgJFeRQnyQ18906Df2
	zyWoaBzE8SHxTBPLRLsPLFEthYyGeJY6UOEGrm3sJgAM2jWhooSdFBEs8C1IL8iWo9QQnsp/RUno+
	pwFS146N4ZpTE9GUdlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkh6-0000000BO8V-47tZ;
	Thu, 26 Jun 2025 11:23:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjWe-0000000BFES-3rcA
	for linux-i3c@bombadil.infradead.org;
	Thu, 26 Jun 2025 10:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+JBZQk9+5pYaD/CIzOksmIKi5WNaVQQZWHpOsiT582E=; b=bDLkxfP16stqN1V0DhyRnc04qk
	W+1IyPYAB0W0vBI3R4YwxpgyEc4i92t0Wro3XVOnTPveFMlzx3kr68Jzf0ebJRLsolxJABxwjNeHa
	71fzVjxkbPcda9e8kBwzMDn7c8WB+1pMP8MZkugpKhKtU8pezrK89PrILKtaVggbLfr3jJvZXj0HD
	L7lBsMiMAf2LobJNZufa3LzBnpXsuGRAfTPjj9gsNyaJ7sjfk+t0s6ILVs8OyUygtP8ptOSzjmbOx
	e4QeqpUPNjFm/RiO0KP4y9QewDK5DguXLeJK+F+fOXSuGK0Nh1tlVI1OKtaapFiK7/ISnGt4QyxDH
	TNSJHp0w==;
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjWb-0000000652v-2MhG
	for linux-i3c@lists.infradead.org;
	Thu, 26 Jun 2025 10:08:11 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q82LYd024500;
	Thu, 26 Jun 2025 06:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=+JBZQ
	k9+5pYaD/CIzOksmIKi5WNaVQQZWHpOsiT582E=; b=zkAgJUDPwdY/kV0OlqSYC
	iFTN2TEJ6p1uH/5cx7hVNa3qlTL3asIGeBf0zmCj1TLvKUBbdggva3b08Cp1HQd2
	nBHR+0br/KIXH6YY94Cwo+7frufqeQC3sD9JBwtNyYRm1fq0tn8d0TMGYywyuKBU
	tqwaKmnjzMoFjFxBrM4fXQ7OGVgW9uP25QJAwOu9FZ5i8slUczl9oILwxLJL5Kuq
	2k1bj6/Dm6hBou5Ap32cx1O08OKg2EPPNYR9RqaixtL2UR/LEgpPbpsoj12LqP30
	NUJVead4UYo+pq8NKgsWfk5tbmO7DifmVgc09Rz1GnKpb7r9bbEfr/5Ed11WdDPD
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47ge72xk14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 06:07:59 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 55QA7wmN043559
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Jun 2025 06:07:58 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 26 Jun 2025 06:07:58 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 26 Jun 2025 06:07:58 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 26 Jun 2025 06:07:58 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.62])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55QA7huw031419;
	Thu, 26 Jun 2025 06:07:52 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Thu, 26 Jun 2025 12:07:36 +0200
Subject: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
MIME-Version: 1.0
Message-ID: <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
In-Reply-To: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <gastmaier@gmail.com>,
        Jorge Marques
	<jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750932463; l=2931;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=DtBgfP4gMa3+l7MHXIJyse+ahiEbPxkfsagoFKikI+Y=;
 b=hsABvo197wtiK5N2tGG7JrDWv8eqXMJKMmsu8B4OGIrqYsgwVIG2pGkkzeANooVGB5+ktMIko
 7/zwHZunGvMCzuAzEbOGL8//zUaRVEHqAfMP6aitsTi0X5YJX4sh8Gq
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: TUBU97KK_ySBFUFhet6CsmRKvFpJSPIo
X-Authority-Analysis: v=2.4 cv=DKGP4zNb c=1 sm=1 tr=0 ts=685d1bff cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=griirDNZpteYz7WkQZ0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-ORIG-GUID: TUBU97KK_ySBFUFhet6CsmRKvFpJSPIo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA4NCBTYWx0ZWRfX839Wymw170+9
 52zEFaESwsQO3zhUY1CVEkuM3uxHA3qAuPMikrlTYDZ7WPWTl3JPiNsJrjc/9Y6O6TNdW0mNkDC
 1ps0EirdUD579BVxArBbEmVHspGZywqkDLpMRySJfGGRamlmuMB1Uk7nZW0fNk4K3QfgJJxxXgj
 1rqY02E7xjL1HRrtwehtYIDTegO6kc9JRiYRHNVk6rxJ7lpw5SIG8pDR2hhehG7c8CXf5SdZItK
 nSR5PczP+QEwzszOcPVKSdhpcWLSbxaFAPNo1c/9sukuWESspsvy8jNnT3JSvvvMrR+cLUMaGML
 I1cVOAUYYrFPaLIFcDlUygXPAYzOq8cCFSCnFDIy+qRWEFtEhbeTTmJgJ2OXiFS8L1N+m/BJFvY
 6CAJqs5fOY2lWp9sq/qxk4hGZs2z5EBe2IK0Cq89TC6aab1ohnLfi9bHSUAdnRT62hcH6gBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 spamscore=0 mlxlogscore=939 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_110810_077966_885FBB10 
X-CRM114-Status: GOOD (  13.73  )
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
b3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+Ci0tLQogLi4uL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1h
c3Rlci0xLjAwLmEueWFtbCAgICAgICAgfCA2NiArKysrKysrKysrKysrKysrKysrKysrCiBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrCiAy
IGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLTEuMDAuYS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci0xLjAw
LmEueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwLi45YmFkMjQxODc4MDBjYjQ3MDkwZjQ0MGI3MGM1MTliM2Y3MTBh
ZGYyCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2kzYy9hZGksaTNjLW1hc3Rlci0xLjAwLmEueWFtbApAQCAtMCwwICsxLDY2IEBACisjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAx
LjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pM2MvYWRpLGkzYy1t
YXN0ZXItMS4wMC5hLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEFuYWxvZyBEZXZpY2VzIEkzQyBDb250cm9sbGVy
CisKK2Rlc2NyaXB0aW9uOiB8CisgIEZQR0EtYmFzZWQgSTNDIGNvbnRyb2xsZXIgZGVzaWduZWQg
dG8gaW50ZXJmYWNlIHdpdGggSTNDIGFuZCBJMkMgcGVyaXBoZXJhbHMsCisgIGltcGxlbWVudGlu
ZyBhIHN1YnNldCBvZiB0aGUgSTNDLWJhc2ljIHNwZWNpZmljYXRpb24uCisKKyAgaHR0cHM6Ly9h
bmFsb2dkZXZpY2VzaW5jLmdpdGh1Yi5pby9oZGwvbGlicmFyeS9pM2NfY29udHJvbGxlcgorCitt
YWludGFpbmVyczoKKyAgLSBKb3JnZSBNYXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+
CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGFkaSxpM2MtbWFzdGVy
LTEuMDAuYQorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGNsb2NrczoKKyAgICBtaW5J
dGVtczogMQorICAgIGl0ZW1zOgorICAgICAgLSBkZXNjcmlwdGlvbjogVGhlIEFYSSBpbnRlcmNv
bm5lY3QgY2xvY2ssIGRyaXZlcyB0aGUgcmVnaXN0ZXIgbWFwLgorICAgICAgLSBkZXNjcmlwdGlv
bjogVGhlIEkzQyBjb250cm9sbGVyIGNsb2NrLiBBWEkgY2xvY2sgZHJpdmVzIGFsbCBsb2dpYyBp
ZiBub3QgcHJvdmlkZWQuCisKKyAgY2xvY2stbmFtZXM6CisgICAgbWluSXRlbXM6IDEKKyAgICBp
dGVtczoKKyAgICAgIC0gY29uc3Q6IGF4aQorICAgICAgLSBjb25zdDogaTNjCisKKyAgaW50ZXJy
dXB0czoKKyAgICBtYXhJdGVtczogMQorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0g
cmVnCisgIC0gY2xvY2tzCisgIC0gY2xvY2stbmFtZXMKKyAgLSBpbnRlcnJ1cHRzCisKK2FsbE9m
OgorICAtICRyZWY6IGkzYy55YW1sIworCit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisK
K2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvaXJxLmg+CisKKyAgICBpM2NANDRhMDAwMDAgeworICAgICAgICBjb21wYXRpYmxl
ID0gImFkaSxpM2MtbWFzdGVyLTEuMDAuYSI7CisgICAgICAgIHJlZyA9IDwweDQ0YTAwMDAwIDB4
MTAwMD47CisgICAgICAgIGludGVycnVwdHMgPSA8MyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKyAg
ICAgICAgY2xvY2tzID0gPCZjbGtjIDE1PiwgPCZjbGtjIDE1PjsKKyAgICAgICAgY2xvY2stbmFt
ZXMgPSAiYXhpIiwgImkzYyI7CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDM+OworICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwwPjsKKworICAgICAgICAvKiBJM0MgYW5kIEkyQyBkZXZpY2VzICov
CisgICAgfTsKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggOTZi
ODI3MDQ5NTAxODRiZDcxNjIzZmY0MWZjNGRmMzFlNGM3ZmU4Ny4uNmY1NmUxN2RjZWNmOTAyYzY4
MTI4MjdjMWVjM2UwNjdjNjVlOTg5NCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJ
TlRBSU5FUlMKQEAgLTExMjQzLDYgKzExMjQzLDExIEBAIFM6CU1haW50YWluZWQKIEY6CURvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYXNwZWVkLGFzdDI2MDAtaTNjLnlhbWwK
IEY6CWRyaXZlcnMvaTNjL21hc3Rlci9hc3QyNjAwLWkzYy1tYXN0ZXIuYwogCitJM0MgRFJJVkVS
IEZPUiBBTkFMT0cgREVWSUNFUyBJM0MgQ09OVFJPTExFUiBJUAorTToJSm9yZ2UgTWFycXVlcyA8
am9yZ2UubWFycXVlc0BhbmFsb2cuY29tPgorUzoJTWFpbnRhaW5lZAorRjoJRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sCisKIEkzQyBEUklW
RVIgRk9SIENBREVOQ0UgSTNDIE1BU1RFUiBJUAogTToJUHJ6ZW15c8WCYXcgR2FqIDxwZ2FqQGNh
ZGVuY2UuY29tPgogUzoJTWFpbnRhaW5lZAoKLS0gCjIuNDkuMAoKCi0tIApsaW51eC1pM2MgbWFp
bGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
