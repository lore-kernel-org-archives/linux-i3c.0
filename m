Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C322DCA0EFF
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Aug 2025 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZZf7NGwdRdZ3HwKO4EiPq/8U9HCJVZ/+L0f8TkjsA8=; b=Sm0nzxUvciFMAo
	990doMCyji49UCd3TNmaMb58Nf05GyUIcS6R3lcW+snCidc6IZaV6/nltLfD8n1cmm520HGx9XFZG
	YIu1I7YmkcgYQVL+zZNhS+NpF9EtPa2otYbHi1l/6UXUHLUyVMgtcGgxwWVrby6I2baCI+plBMBnq
	sPqQjgJA/7Qb/BgCTuy5zoKHzhdLyDaOBAZj134C/vspuseUnE7RAa8k4c5gjmsAPh5Nj28vPCXw7
	kB0u5pxk/m6Y0jt3i3WlVO9LW5NlXIztPyU4KJpb3SOehALChYxwlExL7VtZxkEJFlBJsL2+q7BAX
	CRkw0pqTBTv3wlijel0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIQr-0000000G187-0yQi;
	Wed, 27 Aug 2025 15:51:29 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFDr-0000000FQ0i-3xwz
	for linux-i3c@lists.infradead.org;
	Wed, 27 Aug 2025 12:25:53 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RA7m11018369;
	Wed, 27 Aug 2025 08:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=i0K3t
	mCU53Oueja8xrVMEWpQFkcIm/Fv3Oe9qspgYck=; b=UPxEJssL6lUmp29kSzzU6
	uOdS/LH2UQflH526sI6zJXzIXGbvq0iRve0RP4tp/aJHLAfl60wqQalOAZI6DGM4
	6VJiyV3a7z1KbuhOjCuzXJMq37XY8B+pFd3zgLpz3AIs3KsVyl4vd/wBYV5AF4Ie
	1Kg8YNe9WYFpyVDmBmA0tPhrEHTSAcxCM5loQqj+aBi0MRNT0QfoRIdM7uLtqP5R
	PTrkJl4OwvvhnW1pwTPXUp3jFo9GqcONWoAoAThHNmuI3BTYJdAi8mIJq+EQkZTi
	Tgg3g3uTpJDB1TKDzu4oSUu14FWDFKn6wVoOqVNZOHKLojWctiKV6JT3UlAvbd6i
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 48rmafw4br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 08:25:37 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 57RCPaPP052975
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Aug 2025 08:25:36 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 27 Aug
 2025 08:25:36 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 27 Aug 2025 08:25:36 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.69] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 57RCPHoh002921;
	Wed, 27 Aug 2025 08:25:32 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Wed, 27 Aug 2025 14:25:17 +0200
Subject: [PATCH v8 1/2] dt-bindings: i3c: Add adi-i3c-master
MIME-Version: 1.0
Message-ID: <20250827-adi-i3c-master-v8-1-0a7c78e58bd4@analog.com>
References: <20250827-adi-i3c-master-v8-0-0a7c78e58bd4@analog.com>
In-Reply-To: <20250827-adi-i3c-master-v8-0-0a7c78e58bd4@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756297517; l=3377;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=juN5SXBzGk5T122jBXFeEPh7Fo9Ytv7XvYPMM6KID7Q=;
 b=vPJ9YtU6fxX5Pc8p2v8fjRviTMq8nQnv1W9S+Pwhswo61axRLhZ82zEfNE6SxIQWggkpRwvsY
 nrNtgHhTtLtCVH+MxAgvom/D95LLDDPqBZC/ZV2dH0wPco42l3n8Z+v
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDA3NSBTYWx0ZWRfX2R0Djnj54WPK
 4x0h3/MJTF6N6Hg9wL1NkyugTeg4Fyz8XgZUzApzZK7MvLca2rXRWZWiGMJ1zn8uTYftdKo4QH0
 I48yyMJ1eZbr/3iogGWeKN3GAwXCb5d+FFdPuYf+fRGcj6rO0f71D9L3uq7EL6lN+8qKQy+SwpZ
 rrIGxVzh+lGONCCtdSrc19H9MWIrwxJ7LQalQnd5bMnLuRq80IZCRkh3AOLyblmOno5ObnqrumU
 U4bjmzCddUPQH1UVnoe2RCRL8C+5QQgEjz/zlKWKWKfWmfP8IDOKV11AXTszB3y0fn959+U+NMN
 ZNdr3AlexmfJLJ50xchg0CWFxeAQx/9qj/Nq5v755fHOxVhStFiB4YP/784XlC9XneX5UpyCIxq
 4YCoiuFC
X-Proofpoint-ORIG-GUID: vjEFf5yehsyYOUZeaO4Vy_eWLKhfoTNf
X-Proofpoint-GUID: vjEFf5yehsyYOUZeaO4Vy_eWLKhfoTNf
X-Authority-Analysis: v=2.4 cv=AoXu3P9P c=1 sm=1 tr=0 ts=68aef941 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=wI1k2SEZAAAA:8
 a=gAnH3GRIAAAA:8 a=Br2UW1UjAAAA:8 a=cxqr8dddGolBAesk1vsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=6HWbV-4b7c7AdzY24d_u:22
 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_052551_989572_CCAC95E8 
X-CRM114-Status: GOOD (  15.80  )
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
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMjQ5ODY3MmQyNjU0ODg4NTI1MTIwYzQ0ZjRmYjc0
ZDUwNTUzNTg5MQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pM2MvYWRpLGkzYy1tYXN0ZXIueWFtbApAQCAtMCwwICsxLDcyIEBACisjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAx
LjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pM2MvYWRpLGkzYy1t
YXN0ZXIueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIworCit0aXRsZTogQW5hbG9nIERldmljZXMgSTNDIENvbnRyb2xsZXIKKworZGVz
Y3JpcHRpb246CisgIEZQR0EtYmFzZWQgSTNDIGNvbnRyb2xsZXIgZGVzaWduZWQgdG8gaW50ZXJm
YWNlIHdpdGggSTNDIGFuZCBJMkMgcGVyaXBoZXJhbHMsCisgIGltcGxlbWVudGluZyBhIHN1YnNl
dCBvZiB0aGUgSTNDLWJhc2ljIHNwZWNpZmljYXRpb24uIFRoZSBJUCBjb3JlIGlzIHRlc3RlZAor
ICBvbiBhcm0sIG1pY3JvYmxhemUsIGFuZCBhcm02NCBhcmNoaXRlY3R1cmVzLgorCisgIGh0dHBz
Oi8vYW5hbG9nZGV2aWNlc2luYy5naXRodWIuaW8vaGRsL2xpYnJhcnkvaTNjX2NvbnRyb2xsZXIK
KworbWFpbnRhaW5lcnM6CisgIC0gSm9yZ2UgTWFycXVlcyA8am9yZ2UubWFycXVlc0BhbmFsb2cu
Y29tPgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBhZGksaTNjLW1h
c3Rlci12MQorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIGNsb2NrczoKKyAgICBtaW5J
dGVtczogMQorICAgIGl0ZW1zOgorICAgICAgLSBkZXNjcmlwdGlvbjogVGhlIEFYSSBpbnRlcmNv
bm5lY3QgY2xvY2ssIGRyaXZlcyB0aGUgcmVnaXN0ZXIgbWFwLgorICAgICAgLSBkZXNjcmlwdGlv
bjoKKyAgICAgICAgICBUaGUgc2Vjb25kYXJ5IGNsb2NrLCBkcml2ZXMgdGhlIGludGVybmFsIGxv
Z2ljIGFzeW5jaHJvbm91c2x5IHRvIHRoZQorICAgICAgICAgIHJlZ2lzdGVyIG1hcC4gVGhlIHBy
ZXNlbmNlIG9mIHRoaXMgZW50cnkgc3RhdGVzIHRoYXQgdGhlIElQIENvcmUgd2FzCisgICAgICAg
ICAgc3ludGhlc2l6ZWQgd2l0aCBhIHNlY29uZCBjbG9jayBpbnB1dCwgYW5kIHRoZSBhYnNlbmNl
IG9mIHRoaXMgZW50cnkKKyAgICAgICAgICBpbmRpY2F0ZXMgYSB0b3BvbG9neSB3aGVyZSBhIHNp
bmdsZSBjbG9jayBpbnB1dCBkcml2ZXMgYWxsIHRoZQorICAgICAgICAgIGludGVybmFsIGxvZ2lj
LgorCisgIGNsb2NrLW5hbWVzOgorICAgIG1pbkl0ZW1zOiAxCisgICAgaXRlbXM6CisgICAgICAt
IGNvbnN0OiBheGkKKyAgICAgIC0gY29uc3Q6IGkzYworCisgIGludGVycnVwdHM6CisgICAgbWF4
SXRlbXM6IDEKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIGNsb2Nr
cworICAtIGNsb2NrLW5hbWVzCisgIC0gaW50ZXJydXB0cworCithbGxPZjoKKyAgLSAkcmVmOiBp
M2MueWFtbCMKKwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAg
LSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5o
PgorCisgICAgaTNjQDQ0YTAwMDAwIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJhZGksaTNjLW1h
c3Rlci12MSI7CisgICAgICAgIHJlZyA9IDwweDQ0YTAwMDAwIDB4MTAwMD47CisgICAgICAgIGlu
dGVycnVwdHMgPSA8MyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKyAgICAgICAgY2xvY2tzID0gPCZj
bGtjIDE1PiwgPCZjbGtjIDE1PjsKKyAgICAgICAgY2xvY2stbmFtZXMgPSAiYXhpIiwgImkzYyI7
CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDM+OworICAgICAgICAjc2l6ZS1jZWxscyA9IDww
PjsKKworICAgICAgICAvKiBJM0MgYW5kIEkyQyBkZXZpY2VzICovCisgICAgfTsKZGlmZiAtLWdp
dCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggMzVlZDg0OThhYjFlOWI5MmI0YmNl
NWRiOWJiNjQwMDRkODBlNGIxYS4uZmFhNTA1MzViNTE0MDM3ZGRmOTczMDk4NzRlYzY0YWFjMjAx
M2NiNiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTExNDUy
LDYgKzExNDUyLDExIEBAIFM6CU1haW50YWluZWQKIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pM2MvYXNwZWVkLGFzdDI2MDAtaTNjLnlhbWwKIEY6CWRyaXZlcnMvaTNjL21h
c3Rlci9hc3QyNjAwLWkzYy1tYXN0ZXIuYwogCitJM0MgRFJJVkVSIEZPUiBBTkFMT0cgREVWSUNF
UyBJM0MgQ09OVFJPTExFUiBJUAorTToJSm9yZ2UgTWFycXVlcyA8am9yZ2UubWFycXVlc0BhbmFs
b2cuY29tPgorUzoJTWFpbnRhaW5lZAorRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kzYy9hZGksaTNjLW1hc3Rlci55YW1sCisKIEkzQyBEUklWRVIgRk9SIENBREVOQ0UgSTND
IE1BU1RFUiBJUAogTToJUHJ6ZW15c8WCYXcgR2FqIDxwZ2FqQGNhZGVuY2UuY29tPgogUzoJTWFp
bnRhaW5lZAoKLS0gCjIuNDkuMAoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
