Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA845C83F34
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Jul 2025 07:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++S0vJxWrT0LbXv3SCmmAtZLyMX0TgBi8u9UDFdtYkM=; b=MEIOmFkbQHoYGr
	QFeKxO4wjEj9YDLlksPA7z69IURDcNDXtncqclLnHlfAoVZYm32xc+JJBiLXdIaVwfOQAe8MjpKOf
	TtLftMpDZ5kQcjzRLMk9V46hlkimPlIk9Zb9pHMeh8TcBEoBpTCKg9kbUQfOcUKglG46AjdcowQkK
	riIKLynpG6US7hvQnbRw3zupehW75ZU2/xN6B4Ys14NHq/jl+sxItWCrMdLvyr1PX5hxtA90/hAcp
	i72PQlSLrJRL3ewJZI7berI1zqZEtMs8CP0h8Icp2h23/c8At6y7k4r0EEtMR5s1AGVEqegypZ1QK
	71b8PCsZbfXKnuuyCmMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIz1-00000009Qr3-2SXC;
	Thu, 17 Jul 2025 07:24:47 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIki-00000009O9V-16b0
	for linux-i3c@lists.infradead.org;
	Thu, 17 Jul 2025 07:10:02 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H57J7E007400;
	Thu, 17 Jul 2025 03:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ubRYq
	BIjCj3mZbT9HxemmEuCm6A1jj1svN9C6SKA9QA=; b=FuJbsGjVUa7p6+jNL1guk
	7UAR+MDcm/bHqFVZkC/jF/5ZY83EV68sbvjoYRe1lg+9XKqRaEuTsLaUPxhHJOXz
	kZ5Vt/F85vfV46y8vJnYa+lTFKM/gwTSWvH+Qncu2eWIT2FVVDYVZutvnRNoVpzZ
	PToDhOcjWgvtMIz65R4Y2g4zL6taac6NbdwX13jx/dxBDo4rK7txUPwx6S0Vi9rY
	Jzm0fUjPHVI+rUBIcHRHjdP4UjVsU4Qiq63ZlSHYtQvsiSsR8by7SOshJ93rTf77
	pnOYxrwSV2XGq3e2Nzc7mTasmNp1so5nl0kCqrJD4PCqC9zQ0YiGu5hSnE+5/OAc
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 47x799e495-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 03:09:52 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 56H79pRb046675
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Jul 2025 03:09:51 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 17 Jul
 2025 03:09:51 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 17 Jul 2025 03:09:51 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.72])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 56H79bDO005035;
	Thu, 17 Jul 2025 03:09:47 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Thu, 17 Jul 2025 09:09:20 +0200
Subject: [PATCH v6 1/2] dt-bindings: i3c: Add adi-i3c-master
MIME-Version: 1.0
Message-ID: <20250717-adi-i3c-master-v6-1-6c687ed71bed@analog.com>
References: <20250717-adi-i3c-master-v6-0-6c687ed71bed@analog.com>
In-Reply-To: <20250717-adi-i3c-master-v6-0-6c687ed71bed@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752736178; l=2966;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=hos6iVk11QyXI+zX7kx2DTvqzJd8iugClhi7esuRW5c=;
 b=tL/AtPF5/sGBiQRv6V7W4VdMga4dv119OX8jLVKFx8GDvLVYuP/9mBAJ1YKBD9R6l+YuqGHb1
 vMLVKECzL65CYMgA2ylCmT/6LXCVRhV5eoGxZBx2wYgPPvQJTEBsk37
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA2MSBTYWx0ZWRfX8UDGiwBQaSrz
 Q5wNRbYL7y4SsVngLtkSGm64NrceGg8FitiFtRDSrZBGmi2XLbGWBWU+24CQdRtqIK95iMawbjS
 DMu8phVatzdK97JanNLSCPg/SSmHMs+spWNs1NaXD0Z+vxmPwUNcFAljG+UBTx8hIVeqsvBjIKB
 ZYTn6C0N4Xcl/K03Ke2TT3+toRGOmy1QrPoklkW/5CNuTiZ2xroBkLTJZWVZkIcUM7W/wOizdix
 BuMPyuzCHfIepBvu5+i5au6YO6vHmheRosq8TPtBUroKqOdSBHOfHJpM5bRUdwCmkVRTTXW7aPE
 35gSN6rY5BqwOgLsrOE87yoYH0J4sTR0HByaTHlir4PQ++sxq0r/ICPCD5ODCDbE7CmZ1C5u0ST
 bqbiF1Z5lYONtfIwmJx7yauOOhfcQPIVtxFynGEX4GbshbLAUL0PM1ZfDhVPbhqcbDpDUVBR
X-Authority-Analysis: v=2.4 cv=N6MpF39B c=1 sm=1 tr=0 ts=6878a1c1 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=Q2ZsWLbW85TiznQkgggA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-ORIG-GUID: wMmTU2a8te_o-9Sj8V8Wf9COufDi-lEn
X-Proofpoint-GUID: wMmTU2a8te_o-9Sj8V8Wf9COufDi-lEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=858 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_001000_308949_B25E2C47 
X-CRM114-Status: GOOD (  13.75  )
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
L2FkaSxpM2MtbWFzdGVyLnlhbWwgICAgfCA2NyArKysrKysrKysrKysrKysrKysrKysrCiBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrCiAy
IGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMC4uOGY1MzIzODZkZTJjMDVkM2Q1MTRkNDFmZjRkNmEzN2VjODQwNjc0YwotLS0gL2Rldi9u
dWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvYWRpLGkzYy1t
YXN0ZXIueWFtbApAQCAtMCwwICsxLDY3IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbCMKKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTog
QW5hbG9nIERldmljZXMgSTNDIENvbnRyb2xsZXIKKworZGVzY3JpcHRpb246IHwKKyAgRlBHQS1i
YXNlZCBJM0MgY29udHJvbGxlciBkZXNpZ25lZCB0byBpbnRlcmZhY2Ugd2l0aCBJM0MgYW5kIEky
QyBwZXJpcGhlcmFscywKKyAgaW1wbGVtZW50aW5nIGEgc3Vic2V0IG9mIHRoZSBJM0MtYmFzaWMg
c3BlY2lmaWNhdGlvbi4gVGhlIElQIGNvcmUgaXMgdGVzdGVkCisgIG9uIGFybSwgbWljcm9ibGF6
ZSwgYW5kIGFybTY0IGFyY2hpdGVjdHVyZXMuCisKKyAgaHR0cHM6Ly9hbmFsb2dkZXZpY2VzaW5j
LmdpdGh1Yi5pby9oZGwvbGlicmFyeS9pM2NfY29udHJvbGxlcgorCittYWludGFpbmVyczoKKyAg
LSBKb3JnZSBNYXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+CisKK3Byb3BlcnRpZXM6
CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGFkaSxpM2MtbWFzdGVyLXYxCisKKyAgcmVnOgor
ICAgIG1heEl0ZW1zOiAxCisKKyAgY2xvY2tzOgorICAgIG1pbkl0ZW1zOiAxCisgICAgaXRlbXM6
CisgICAgICAtIGRlc2NyaXB0aW9uOiBUaGUgQVhJIGludGVyY29ubmVjdCBjbG9jaywgZHJpdmVz
IHRoZSByZWdpc3RlciBtYXAuCisgICAgICAtIGRlc2NyaXB0aW9uOiBUaGUgSTNDIGNvbnRyb2xs
ZXIgY2xvY2suIEFYSSBjbG9jayBkcml2ZXMgYWxsIGxvZ2ljIGlmIG5vdCBwcm92aWRlZC4KKwor
ICBjbG9jay1uYW1lczoKKyAgICBtaW5JdGVtczogMQorICAgIGl0ZW1zOgorICAgICAgLSBjb25z
dDogYXhpCisgICAgICAtIGNvbnN0OiBpM2MKKworICBpbnRlcnJ1cHRzOgorICAgIG1heEl0ZW1z
OiAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBjbG9ja3MKKyAg
LSBjbG9jay1uYW1lcworICAtIGludGVycnVwdHMKKworYWxsT2Y6CisgIC0gJHJlZjogaTNjLnlh
bWwjCisKK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAor
ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KKwor
ICAgIGkzY0A0NGEwMDAwMCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGkzYy1tYXN0ZXIt
djEiOworICAgICAgICByZWcgPSA8MHg0NGEwMDAwMCAweDEwMDA+OworICAgICAgICBpbnRlcnJ1
cHRzID0gPDMgSVJRX1RZUEVfTEVWRUxfSElHSD47CisgICAgICAgIGNsb2NrcyA9IDwmY2xrYyAx
NT4sIDwmY2xrYyAxNT47CisgICAgICAgIGNsb2NrLW5hbWVzID0gImF4aSIsICJpM2MiOworICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsKKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisK
KyAgICAgICAgLyogSTNDIGFuZCBJMkMgZGV2aWNlcyAqLworICAgIH07CmRpZmYgLS1naXQgYS9N
QUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGQ1YTE3M2U5ODdjMDZkNzU4NDhkMTEyMzM5
ZTM5OTY2ZjJiNzFjZWEuLjFmMjEyNTI5Mjc2ZjRhYjI4ZjRiN2QxNmI0MTA1YThjZjlmZjVlMmUg
MTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xMTQ1Miw2ICsx
MTQ1MiwxMSBAQCBTOglNYWludGFpbmVkCiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTNjL2FzcGVlZCxhc3QyNjAwLWkzYy55YW1sCiBGOglkcml2ZXJzL2kzYy9tYXN0ZXIv
YXN0MjYwMC1pM2MtbWFzdGVyLmMKIAorSTNDIERSSVZFUiBGT1IgQU5BTE9HIERFVklDRVMgSTND
IENPTlRST0xMRVIgSVAKK006CUpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNAYW5hbG9nLmNv
bT4KK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
M2MvYWRpLGkzYy1tYXN0ZXIueWFtbAorCiBJM0MgRFJJVkVSIEZPUiBDQURFTkNFIEkzQyBNQVNU
RVIgSVAKIE06CVByemVteXPFgmF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KIFM6CU1haW50YWlu
ZWQKCi0tIAoyLjQ5LjAKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=
