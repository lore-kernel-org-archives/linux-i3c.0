Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D9EC36008
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Mar 2025 06:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9i2V1b+2kJ54QxQIQ1oXLA6PpWf+9bA/gR4fHt0cy7A=; b=MGHgZU5iFZyIWC
	togu4G1dqb2wIt43EDV+GGu6F8Ew8P6WEg2lteJHaGIQcRklavrnmCBp0QrNTakVS8Ipk3QLaPC/c
	f5QVtd8+ozfTT5q3vINOMRahnjsXws9OGcA88d7vZEM97uMB9s7Gc07Q8dG/zYnNizsTAY6PT92TN
	/j1y0LT1vYN/33Jwgjfc8RtjiPOdDO1poZ9Me8tO8iU/2cOAeZI80atbRcbHCRE2+nUxuxJddIFje
	gXzf6CdwxYhSLLCthKyqvGpw2CWlt2yn8DeENGsjIYJvrnGYE1r89U5rKS8PC/J/GqCEvgTb7X2GR
	IRfMM9d4k4kLzng2Iw/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKX8-00000007gdc-0vQF;
	Wed, 26 Mar 2025 06:46:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKVp-00000007gYM-168R
	for linux-i3c@lists.infradead.org;
	Wed, 26 Mar 2025 06:45:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q64GBL026608;
	Wed, 26 Mar 2025 06:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d//EkLK8NlNhrMxANYCpSXjTkPzJKf9XO3dDZrPjyb4=; b=CYnczo+StkThpktw
	v/OqgyADRy3nZv1CHyRHSpAeWT5DN9ThhTw5OfNVcY9+k5KOtcC005gShLvx5hqG
	aUAT9ys0k2q3FhZ0SgF11+j5UaWGkEQz9FcywnPXkQw9a0M+ByZ6nOoTASQ6hAeE
	ji3Rmw5oCoDqYUunU6l0LUhfHeKKkuDD0ylC241psTlQ7iwJ4VDfT6wPF0eo7j9X
	ly6cHIG+ftuTVHrBm8Q8xtuIxMut1Or6me6WB2EY3nkZ4AxO+b7UF84pYvpdE/tQ
	H0acLYQKeywEFr7JL8eY+5sTzouXDfjyH54JyII+5v1vn+XM8aGYaqSUz26B1L8g
	9dE1Gg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcybwy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 06:45:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q6j6U1011352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 06:45:06 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 23:45:03 -0700
Message-ID: <8c624cf0-febc-4ab9-8141-2372bfe4d577@quicinc.com>
Date: Wed, 26 Mar 2025 12:15:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] i3c: Fix read from unreadable memory at
 i3c_master_queue_ibi()
To: Frank Li <Frank.li@nxp.com>,
        Manjunatha Venkatesh
	<manjunatha.venkatesh@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <bbrezillon@kernel.org>,
        <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <rvmanjumce@gmail.com>, <stable@vger.kernel.org>
References: <20250325102332.2435069-1-manjunatha.venkatesh@nxp.com>
 <Z+LA/GASTPMMcVpC@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <Z+LA/GASTPMMcVpC@lizhi-Precision-Tower-5810>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e3a273 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=v-MiteamF9m1uwOrjlcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: L2jECwzCxSH8wi0t7I2AstVutKQazjYD
X-Proofpoint-GUID: L2jECwzCxSH8wi0t7I2AstVutKQazjYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_234517_316216_298C761D 
X-CRM114-Status: GOOD (  27.32  )
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

CgpPbiAzLzI1LzIwMjUgODoxMyBQTSwgRnJhbmsgTGkgd3JvdGU6Cj4gU3ViamVjdCBzaG91bGQg
YmUKPiAKPiBpM2M6IEFkZCBOVUxMIHBvaW50ZXIgY2hlY2sgaW4gaTNjX21hc3Rlcl9xdWV1ZV9p
YmkoKQo+IAp5ZXMsIEFsaWduZWQuCj4gT24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMDM6NTM6MzJQ
TSArMDUzMCwgTWFuanVuYXRoYSBWZW5rYXRlc2ggd3JvdGU6Cj4+IEFzIHBhcnQgb2YgSTNDIGRy
aXZlciBwcm9iaW5nIHNlcXVlbmNlIGZvciBwYXJ0aWN1bGFyIGRldmljZSBpbnN0YW5jZSwKPj4g
V2hpbGUgYWRkaW5nIHRvIHF1ZXVlIGl0IGlzIHRyeWluZyB0byBhY2Nlc3MgaWJpIHZhcmlhYmxl
IG9mIGRldiB3aGljaCBpcwo+PiBub3QgeWV0IGluaXRpYWxpemVkIGNhdXNpbmcgIlVuYWJsZSB0
byBoYW5kbGUga2VybmVsIHJlYWQgZnJvbSB1bnJlYWRhYmxlCj4+IG1lbW9yeSIgcmVzdWx0aW5n
IGluIGtlcm5lbCBwYW5pYy4KPj4KPj4gQmVsb3cgaXMgdGhlIHNlcXVlbmNlIHdoZXJlIHRoaXMg
aXNzdWUgaGFwcGVuZWQuCj4+IDEuIER1cmluZyBib290IHVwIHNlcXVlbmNlIElCSSBpcyByZWNl
aXZlZCBhdCBob3N0ICBmcm9tIHRoZSBzbGF2ZSBkZXZpY2UKPj4gICAgIGJlZm9yZSByZXF1ZXN0
aW5nIGZvciBJQkksIFVzdWFsbHkgd2lsbCByZXF1ZXN0IElCSSBieSBjYWxsaW5nCj4+ICAgICBp
M2NfZGV2aWNlX3JlcXVlc3RfaWJpKCkgZHVyaW5nIHByb2JlIG9mIHNsYXZlIGRyaXZlci4KPj4g
Mi4gU2luY2UgbWFzdGVyIGNvZGUgdHJ5aW5nIHRvIGFjY2VzcyBJQkkgVmFyaWFibGUgZm9yIHRo
ZSBwYXJ0aWN1bGFyCj4+ICAgICBkZXZpY2UgaW5zdGFuY2UgYmVmb3JlIGFjdHVhbGx5IGl0IGlu
aXRpYWxpemVkIGJ5IHNsYXZlIGRyaXZlciwKPj4gICAgIGR1ZSB0byB0aGlzIHJhbmRvbWx5IGFj
Y2Vzc2luZyB0aGUgYWRkcmVzcyBhbmQgY2F1c2luZyBrZXJuZWwgcGFuaWMuCj4+IDMuIGkzY19k
ZXZpY2VfcmVxdWVzdF9pYmkoKSBmdW5jdGlvbiBpbnZva2VkIGJ5IHRoZSBzbGF2ZSBkcml2ZXIg
d2hlcmUKPj4gICAgIGRldi0+aWJpID0gaWJpOyBhc3NpZ25lZCBhcyBwYXJ0IG9mIGZ1bmN0aW9u
IGNhbGwKPj4gICAgIGkzY19kZXZfcmVxdWVzdF9pYmlfbG9ja2VkKCkuCj4+IDQuIEJ1dCB3aGVu
IElCSSByZXF1ZXN0IHNlbnQgYnkgc2xhdmUgZGV2aWNlLCBtYXN0ZXIgY29kZSAgdHJ5aW5nIHRv
IGFjY2Vzcwo+PiAgICAgdGhpcyB2YXJpYWJsZSBiZWZvcmUgaXRzIGluaXRpYWxpemVkIGR1ZSB0
byB0aGlzIHJhY2UgY29uZGl0aW9uCj4+ICAgICBzaXR1YXRpb24ga2VybmVsIHBhbmljIGhhcHBl
bmVkLgo+IAo+IEhvdyBhYm91dCBjb21taXQgbWVzc2FnZSBhczoKPiAKPiBUaGUgSTNDIG1hc3Rl
ciBkcml2ZXIgbWF5IHJlY2VpdmUgYW4gSUJJIGZyb20gYSB0YXJnZXQgZGV2aWNlIHRoYXQgaGFz
IG5vdAo+IGJlZW4gcHJvYmVkIHlldC4gSW4gc3VjaCBjYXNlcywgdGhlIG1hc3RlciBjYWxscyBg
aTNjX21hc3Rlcl9xdWV1ZV9pYmkoKWAKPiB0byBxdWV1ZSBhbiBJQkkgd29yayB0YXNrLCBsZWFk
aW5nIHRvICJVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCByZWFkIGZyb20KPiB1bnJlYWRhYmxlIG1l
bW9yeSIgYW5kIHJlc3VsdGluZyBpbiBhIGtlcm5lbCBwYW5pYy4KPiAKPiBUeXBpY2FsIElCSSBo
YW5kbGluZyBmbG93Ogo+IDEuIFRoZSBJM0MgbWFzdGVyIHNjYW5zIHRhcmdldCBkZXZpY2VzIGFu
ZCBwcm9iZXMgdGhlaXIgcmVzcGVjdGl2ZSBkcml2ZXJzLgo+IDIuIFRoZSB0YXJnZXQgZGV2aWNl
IGRyaXZlciBjYWxscyBgaTNjX2RldmljZV9yZXF1ZXN0X2liaSgpYCB0byBlbmFibGUgSUJJCj4g
ICAgIGFuZCBhc3NpZ25zIGBkZXYtPmliaSA9IGliaWAuCj4gMy4gVGhlIEkzQyBtYXN0ZXIgcmVj
ZWl2ZXMgYW4gSUJJIGZyb20gdGhlIHRhcmdldCBkZXZpY2UgYW5kIGNhbGxzCj4gICAgIGBpM2Nf
bWFzdGVyX3F1ZXVlX2liaSgpYCB0byBxdWV1ZSB0aGUgdGFyZ2V0IGRldmljZSBkcml2ZXLigJlz
IElCSSBoYW5kbGVyCj4gICAgIHRhc2suCj4gCj4gSG93ZXZlciwgc2luY2UgdGFyZ2V0IGRldmlj
ZSBldmVudHMgYXJlIGFzeW5jaHJvbm91cyB0byB0aGUgSTNDIHByb2JlCj4gc2VxdWVuY2UsIHN0
ZXAgMyBtYXkgb2NjdXIgYmVmb3JlIHN0ZXAgMiwgY2F1c2luZyBgZGV2LT5pYmlgIHRvIGJlIGBO
VUxMYCwKPiBsZWFkaW5nIHRvIGEga2VybmVsIHBhbmljLgo+IAo+IEFkZCBhIE5VTEwgcG9pbnRl
ciBjaGVjayBpbiBgaTNjX21hc3Rlcl9xdWV1ZV9pYmkoKWAgdG8gcHJldmVudCBhY2Nlc3NpbmcK
PiBhbiB1bmluaXRpYWxpemVkIGBkZXYtPmliaWAsIGVuc3VyaW5nIHN0YWJpbGl0eS4KPiAKPj4K
Pj4gRml4ZXM6IDNhMzc5YmJjZWEwYWYgKCJpM2M6IEFkZCBjb3JlIEkzQyBpbmZyYXN0cnVjdHVy
ZSIpCj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4+IExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvWjlnakdZdWRpWXlsM2JTZUBsaXpoaS1QcmVjaXNpb24tVG93ZXItNTgx
MC8KPj4gU2lnbmVkLW9mZi1ieTogTWFuanVuYXRoYSBWZW5rYXRlc2ggPG1hbmp1bmF0aGEudmVu
a2F0ZXNoQG54cC5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIHNpbmNlIHY0Ogo+PiAgICAtIEZpeCBh
ZGRlZCBhdCBnZW5lcmljIHBsYWNlcyBtYXN0ZXIuYyB3aGljaCBpcyBhcHBsaWNhYmxlIGZvciBh
bGwgcGxhdGZvcm1zCj4+Cj4+ICAgZHJpdmVycy9pM2MvbWFzdGVyLmMgfCAzICsrKwo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPj4gaW5kZXggZDVkYzQxODBhZmJj
Li5jNjUwMDZhYTA2ODQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4+ICsr
KyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4+IEBAIC0yNTYxLDYgKzI1NjEsOSBAQCBzdGF0aWMg
dm9pZCBpM2NfbWFzdGVyX3VucmVnaXN0ZXJfaTNjX2RldnMoc3RydWN0IGkzY19tYXN0ZXJfY29u
dHJvbGxlciAqbWFzdGVyKQo+PiAgICAqLwo+PiAgIHZvaWQgaTNjX21hc3Rlcl9xdWV1ZV9pYmko
c3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LCBzdHJ1Y3QgaTNjX2liaV9zbG90ICpzbG90KQo+PiAg
IHsKPj4gKwlpZiAoIWRldi0+aWJpIHx8ICFzbG90KQo+PiArCQlyZXR1cm47Cj4+ICsKMS4gU2hv
dWxkbid0IHRoaXMgYmUgYSBMb2dpY2FsIEFORCA/IHdoYXQgaWYgc2xvdCBpcyBub24gTlVMTCBi
dXQgdGhlIApJQkkgaXMgTlVMTCA/CgoyLiBUaGlzIGJlaW5nIHZvaWQgZnVuY3Rpb24sIGl0IGRv
ZXNuJ3Qgc2F5IGFueXRoaW5nIHRvIGNhbGxlciBpZiBpdCdzIApzdWNjZXNzZnVsIG9yIGZhaWxl
ZCA/IFNob3VsZCB3ZSBtYWtlIHRoaXMgbm9uIHZvaWQgZnVuY3Rpb24gPwppZiBub3QsIGkgYW0g
dGhpbmtpbmcgaXQgbWF5IHJ1biBpbnRvIG11bHRpcGxlIGF0dGVtcHRzLCBubyBsb2cgdG9vLgo+
PiAgIAlhdG9taWNfaW5jKCZkZXYtPmliaS0+cGVuZGluZ19pYmlzKTsKPj4gICAJcXVldWVfd29y
ayhkZXYtPmliaS0+d3EsICZzbG90LT53b3JrKTsKPj4gICB9Cj4+IC0tCj4+IDIuNDYuMQo+Pgo+
IAoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cg==
