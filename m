Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D1BCA0EF1
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Aug 2025 13:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GV+7KALwLNSy9lhzqFBEFLjtx+UJLcYRBAIfRXrZA9w=; b=OImu3+28JACaJ1
	j9QMn+5Qsr/D85JailWtmh3D9gfkAabHSTc3CdDVM/EXBqa5KqJPu6nT/+nVIN7gkm2TEj2tQEhPG
	N2yYOiOSqX39DiYn7eB7HXjYgq4at7Va9NGDA2HIeNwNbQIbBQeeZDhJ5nhMDOR68QIrVaGZ/bmwB
	f8aQ7F6uvHs5Idy47hqhcoxk1G3LNK/I1fEJTDecO8jZqGQv3nIRtJodZhpP54xElAP+lUTSiPENR
	nSqQzDgUfCHjTbhHsFpPutd9vBejwggje65xIDmNXaHfhIX3UmG6Rgd6Jwhi7WNzXevfZBPB56zsY
	6bKEsUtZUyGMGGwE0cdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo07h-00000007bTd-2S0w;
	Mon, 18 Aug 2025 13:42:05 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unyP0-00000007Gjo-2YMA
	for linux-i3c@lists.infradead.org;
	Mon, 18 Aug 2025 11:51:51 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IAi6nl023181;
	Mon, 18 Aug 2025 07:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=lbrPz
	qvVw+AhfHe0zcNw07xz+B0T3X5w3fk6Qz7465I=; b=BHDYwOBirftECZntT/s1q
	f6rnA7EUZtsLXvHw+C6UpgPSTvuRllNhwb1s3r4UaT/vXzk3TykRBod1aL94JQen
	sbZEzYfZHujEmVujHOba7bjunG5oYYVr+1xcoO+3wYKSTlklsAlOgw1zLYHPVd/h
	PsFo7l2uZceyUXbB9TS/JYwSWJiE4aWpPZF/daOK8rrGBV4S0YiPpyIq2SDd6SKj
	7QEu1cXU/9pgYOe47pkCRE+x1hPt1rARogNNCohxZ60qDWOHB1d0aQr3/e+o/TQb
	KKqLSgP+V35Hj28PFRh04IeIGpr2FLqK/prgl+ehncqhuXxzFoTleGwfbwtXWjeA
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 48k8afdtg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 07:51:37 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 57IBpasg036341
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Aug 2025 07:51:36 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 18 Aug 2025 07:51:36 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 18 Aug 2025 07:51:36 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 18 Aug 2025 07:51:34 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.53])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 57IBpIJT022575;
	Mon, 18 Aug 2025 07:51:28 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Mon, 18 Aug 2025 13:51:13 +0200
Subject: [PATCH v7 1/2] dt-bindings: i3c: Add adi-i3c-master
MIME-Version: 1.0
Message-ID: <20250818-adi-i3c-master-v7-1-f7207902669d@analog.com>
References: <20250818-adi-i3c-master-v7-0-f7207902669d@analog.com>
In-Reply-To: <20250818-adi-i3c-master-v7-0-f7207902669d@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <gastmaier@gmail.com>,
        <linux-hardening@vger.kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755517878; l=3381;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=UdrsGhVMwqo5cE3+96QM8wAbjr6GF1F6npOZOYlDM6Q=;
 b=fJRuu/5V8WB2EauWIffsKvS5gFX7UKVuGsk3HK6u5HSvoLx4uhPxK1tsN9PBzkB4Er176ziwY
 azJbNO9gIAQCAawZesWn4Q6D7ABz7vjF0OJgE87DPz9BKK7pz+QyUzr
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE3MDA0NiBTYWx0ZWRfXwXeu2vXtvpvP
 ksNRfJRdzSX4hSxctMNrq0qnMN9y2S0prQ+1EJpwqBKIamE0iPc2REnyJ1OWzrUuEiMjmbUgjyc
 9Gg4xwSbzlo5eoLPN4NTaHk6jP3ekZQKLl7tFMf28d0zDRsjF43AYrP+ouksHrgozyifIf5qJBk
 FVT5slSUEVXcCRgKNH9A4scPhJNGy15oFRsnq8KedwYsk2xbxUPvyN9aZySdbpUeXiJyOreAzPh
 6uLKKOb2ZJKcIGfnbMgTRD6qOeliFzjCFkiLGtAJvyjqUpsWG8OKipVQZuQb3SqlTDTzxUiZTIh
 6UcZihgOs0D3k7+vuxw75jfymi2DnOBhojfeA+3foKX+0ngu4j6ZH/b3yXDIdFoLfXHBa4Lp5R/
 46EpMCq0
X-Authority-Analysis: v=2.4 cv=WvwrMcfv c=1 sm=1 tr=0 ts=68a313c9 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=cxqr8dddGolBAesk1vsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-GUID: d5g9qbpUxXvILPLKjmYEPr4aqXSd_Zfo
X-Proofpoint-ORIG-GUID: d5g9qbpUxXvILPLKjmYEPr4aqXSd_Zfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508170046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_045150_654282_901B0266 
X-CRM114-Status: GOOD (  16.43  )
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
b250cm9sbGVyIHNwZWNpZmljYXRpb24uClRoZSBJUCBDb3JlIGlzIHZlcnNpb25lZCBmb2xsb3dp
bmcgU2VtYW50aWMgVmVyc2lvbmluZyAyLjAuMCBhbmQKQURJJ3Mgb3Blbi1zb3VyY2UgSERMIGd1
aWRlbGluZXMgZm9yIGRldmljZXRyZWUgYmluZGluZ3MgYW5kIGRyaXZlcnMuCgpTaWduZWQtb2Zm
LWJ5OiBKb3JnZSBNYXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxvZy5jb20+Ci0tLQogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2MtbWFzdGVyLnlhbWwgICAgfCA3MiArKysrKysr
KysrKysrKysrKysrKysrCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA1ICsrCiAyIGZpbGVzIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxpM2Mt
bWFzdGVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL2FkaSxp
M2MtbWFzdGVyLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uZmRhMjQwZjllZTBjNzNiY2JlYTk3Zjc3NWQ2ZTA4
MWZlMGMwODlkOQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbApAQCAtMCwwICsxLDcyIEBACisjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAx
LjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pM2MvYWRpLGkzYy1t
YXN0ZXIueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIworCit0aXRsZTogQW5hbG9nIERldmljZXMgSTNDIENvbnRyb2xsZXIKKworZGVz
Y3JpcHRpb246IHwKKyAgRlBHQS1iYXNlZCBJM0MgY29udHJvbGxlciBkZXNpZ25lZCB0byBpbnRl
cmZhY2Ugd2l0aCBJM0MgYW5kIEkyQyBwZXJpcGhlcmFscywKKyAgaW1wbGVtZW50aW5nIGEgc3Vi
c2V0IG9mIHRoZSBJM0MtYmFzaWMgc3BlY2lmaWNhdGlvbi4gVGhlIElQIGNvcmUgaXMgdGVzdGVk
CisgIG9uIGFybSwgbWljcm9ibGF6ZSwgYW5kIGFybTY0IGFyY2hpdGVjdHVyZXMuCisKKyAgaHR0
cHM6Ly9hbmFsb2dkZXZpY2VzaW5jLmdpdGh1Yi5pby9oZGwvbGlicmFyeS9pM2NfY29udHJvbGxl
cgorCittYWludGFpbmVyczoKKyAgLSBKb3JnZSBNYXJxdWVzIDxqb3JnZS5tYXJxdWVzQGFuYWxv
Zy5jb20+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IGFkaSxpM2Mt
bWFzdGVyLXYxCisKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKKyAgY2xvY2tzOgorICAgIG1p
bkl0ZW1zOiAxCisgICAgaXRlbXM6CisgICAgICAtIGRlc2NyaXB0aW9uOiBUaGUgQVhJIGludGVy
Y29ubmVjdCBjbG9jaywgZHJpdmVzIHRoZSByZWdpc3RlciBtYXAuCisgICAgICAtIGRlc2NyaXB0
aW9uOiB8CisgICAgICAgICAgVGhlIHNlY29uZGFyeSBjbG9jaywgZHJpdmVzIHRoZSBpbnRlcm5h
bCBsb2dpYyBhc3luY2hyb25vdXNseSB0byB0aGUKKyAgICAgICAgICByZWdpc3RlciBtYXAuIFRo
ZSBwcmVzZW5jZSBvZiB0aGlzIGVudHJ5IHN0YXRlcyB0aGF0IHRoZSBJUCBDb3JlIHdhcworICAg
ICAgICAgIHN5bnRoZXNpemVkIHdpdGggYSBzZWNvbmQgY2xvY2sgaW5wdXQsIGFuZCB0aGUgYWJz
ZW5jZSBvZiB0aGlzIGVudHJ5CisgICAgICAgICAgaW5kaWNhdGVzIGEgdG9wb2xvZ3kgd2hlcmUg
YSBzaW5nbGUgY2xvY2sgaW5wdXQgZHJpdmVzIGFsbCB0aGUKKyAgICAgICAgICBpbnRlcm5hbCBs
b2dpYy4KKworICBjbG9jay1uYW1lczoKKyAgICBtaW5JdGVtczogMQorICAgIGl0ZW1zOgorICAg
ICAgLSBjb25zdDogYXhpCisgICAgICAtIGNvbnN0OiBpM2MKKworICBpbnRlcnJ1cHRzOgorICAg
IG1heEl0ZW1zOiAxCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBj
bG9ja3MKKyAgLSBjbG9jay1uYW1lcworICAtIGludGVycnVwdHMKKworYWxsT2Y6CisgIC0gJHJl
ZjogaTNjLnlhbWwjCisKK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6
CisgIC0gfAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9p
cnEuaD4KKworICAgIGkzY0A0NGEwMDAwMCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGkz
Yy1tYXN0ZXItdjEiOworICAgICAgICByZWcgPSA8MHg0NGEwMDAwMCAweDEwMDA+OworICAgICAg
ICBpbnRlcnJ1cHRzID0gPDMgSVJRX1RZUEVfTEVWRUxfSElHSD47CisgICAgICAgIGNsb2NrcyA9
IDwmY2xrYyAxNT4sIDwmY2xrYyAxNT47CisgICAgICAgIGNsb2NrLW5hbWVzID0gImF4aSIsICJp
M2MiOworICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwzPjsKKyAgICAgICAgI3NpemUtY2VsbHMg
PSA8MD47CisKKyAgICAgICAgLyogSTNDIGFuZCBJMkMgZGV2aWNlcyAqLworICAgIH07CmRpZmYg
LS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDM1ZWQ4NDk4YWIxZTliOTJi
NGJjZTVkYjliYjY0MDA0ZDgwZTRiMWEuLmZhYTUwNTM1YjUxNDAzN2RkZjk3MzA5ODc0ZWM2NGFh
YzIwMTNjYjYgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0x
MTQ1Miw2ICsxMTQ1MiwxMSBAQCBTOglNYWludGFpbmVkCiBGOglEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaTNjL2FzcGVlZCxhc3QyNjAwLWkzYy55YW1sCiBGOglkcml2ZXJzL2kz
Yy9tYXN0ZXIvYXN0MjYwMC1pM2MtbWFzdGVyLmMKIAorSTNDIERSSVZFUiBGT1IgQU5BTE9HIERF
VklDRVMgSTNDIENPTlRST0xMRVIgSVAKK006CUpvcmdlIE1hcnF1ZXMgPGpvcmdlLm1hcnF1ZXNA
YW5hbG9nLmNvbT4KK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbAorCiBJM0MgRFJJVkVSIEZPUiBDQURFTkNF
IEkzQyBNQVNURVIgSVAKIE06CVByemVteXPFgmF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KIFM6
CU1haW50YWluZWQKCi0tIAoyLjQ5LjAKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
