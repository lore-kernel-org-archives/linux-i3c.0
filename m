Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59ABC02199
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Feb 2025 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qL7cK6lw1nhuOO1Q3ytYN57DpalbsUjD9IB4Qz/lnuE=; b=EuBaukLkBycwfXlLrW2Qm1dwc/
	LJKPErQ1wDmlsKObsB0x13MTjriEM8P/zsmyqe89Ig5+FmR05Yt9AtWHqseY3VyJxE7IgT8GwvGr7
	D8A4PsOJNxjUp9ML/EXc/T+CvVuN3ygtquDKHe4URyfUeWiC/bD4GvFi0e6U0Li9hJQAU1PdgvBNW
	APjIYUwlEBWXPxwKwq41R6FlowtmgNmnT3nYQIs3y5v3+vClfxgZHmlQ/asMZtn6XZ0Lhdl85MtdH
	doSmvr8orQMd+DqaYQvxU1QG4NXspqT2eEwlN1DsbRUCTTc68nibYGGHmcvNJ68C3xQNOAkl00oyy
	oVJJB8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgN5T-00000009RXx-14J3;
	Fri, 07 Feb 2025 12:03:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgN5Q-00000009RXS-2nkQ
	for linux-i3c@lists.infradead.org;
	Fri, 07 Feb 2025 12:03:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517BNkpv032714;
	Fri, 7 Feb 2025 12:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KB5ry0822fOnZO8OHnNGA51DXxbTzPAyb6lNTnpm0SY=; b=SPLTILhMnRumfKXc
	DGZsN/ISYCLQrAPXO68P1RE7OC18H/Viu1uakQ2AjWAAcoHRc4M9KM7A9SUDEUdf
	dat4r1wREUiO/Pw66Dtns+9us8eKgmi01fLf21xlXcqzMUHQL/esbTdrQpl1V7Xm
	37qbM4a/uuIwOHc/VzBQpTa0wuo5rHIcoZlZ7myWb4T3lQ55Lyepn8E7scp0BfOs
	kkoyntBxBQH1FJqdSjXkkNKgXpuUD4Vgmkn51yoI1nC/u8dLy4o9ESuipBZBea8Q
	64Sq247MN05QS0iIn3t8NHyNwJHgOgPoZy6p7pPHa/FsgjMS6CT7jWQ8HCKdEQRy
	0YCSCA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nh8ur31c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 12:03:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517C3np7018892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 12:03:49 GMT
Received: from [10.216.49.103] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 04:03:46 -0800
Message-ID: <f643c57e-de01-4372-a1b1-7ebde319d0a4@quicinc.com>
Date: Fri, 7 Feb 2025 17:33:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: i3c: Add Qualcomm I3C master
 controller bindings
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-2-quic_msavaliy@quicinc.com>
 <248000f5-63db-492c-884d-ac72db337493@kernel.org>
 <0ae3f754-edcb-4b22-9d49-b20ef264554b@quicinc.com>
Content-Language: en-US
In-Reply-To: <0ae3f754-edcb-4b22-9d49-b20ef264554b@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vkhAe4T5TKsvZ_7DZJX4KB0oPC5tPaJN
X-Proofpoint-ORIG-GUID: vkhAe4T5TKsvZ_7DZJX4KB0oPC5tPaJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_05,2025-02-07_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_040356_730108_EFCEEE73 
X-CRM114-Status: GOOD (  22.92  )
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

SGkgS3J6eXN6dG9mLAoKT24gMi82LzIwMjUgNzoxMyBQTSwgTXVrZXNoIEt1bWFyIFNhdmFsaXlh
IHdyb3RlOgo+IEhpIEtyenlzenRvZizCoCBUaGFua3MgIQo+IAo+IE9uIDIvNS8yMDI1IDg6MTIg
UE0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIDA1LzAyLzIwMjUgMTU6MzEsIE11
a2VzaCBLdW1hciBTYXZhbGl5YSB3cm90ZToKPj4+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBm
b3IgdGhlIFF1YWxjb21tIEkzQyBtYXN0ZXIgY29udHJvbGxlci4gVGhpcwo+Pj4gaW5jbHVkZXMg
dGhlIG5lY2Vzc2FyeSBkb2N1bWVudGF0aW9uIGFuZCBwcm9wZXJ0aWVzIHJlcXVpcmVkIHRvIGRl
c2NyaWJlCj4+PiB0aGUgaGFyZHdhcmUgaW4gdGhlIGRldmljZSB0cmVlLgo+Pgo+PiBBIG5pdCwg
c3ViamVjdDogZHJvcCBzZWNvbmQvbGFzdCwgcmVkdW5kYW50ICJiaW5kaW5ncyIuIFRoZQo+PiAi
ZHQtYmluZGluZ3MiIHByZWZpeCBpcyBhbHJlYWR5IHN0YXRpbmcgdGhhdCB0aGVzZSBhcmUgYmlu
ZGluZ3MuCj4gU3VyZQo+PiBTZWUgYWxzbzoKPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjYuNy1yYzgvc291cmNlL0RvY3VtZW50YXRpb24vIAo+PiBkZXZpY2V0cmVlL2JpbmRp
bmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDE4Cj4+Cj4+IFVzZSBtb2Rlcm4gdGVybWlub2xv
Z3ksIHdoaWNoIG1lYW5zOgo+PiBzL21hc3Rlci93aGF0ZXZlciBlbHNlIG9yIGV2ZW4gbm90aGlu
Zy8KPj4gU2VlIG90aGVyIHJlY2VudCBiaW5kaW5ncyBhbmQgZGlzY3Vzc2lvbnMuCj4+Cj4gU3Vy
ZQo+Pgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE11a2VzaCBLdW1hciBTYXZhbGl5YSA8cXVpY19t
c2F2YWxpeUBxdWljaW5jLmNvbT4KPj4+IC0tLQo+Pj4gwqAgLi4uL2JpbmRpbmdzL2kzYy9xY29t
LGkzYy1tYXN0ZXIueWFtbMKgwqDCoMKgwqDCoMKgwqAgfCA1NyArKysrKysrKysrKysrKysrKysr
Cj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQo+Pj4gwqAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvcWNvbSxpM2Mt
IAo+Pj4gbWFzdGVyLnlhbWwKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2kzYy9xY29tLGkzYy0gCj4+PiBtYXN0ZXIueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pM2MvcWNvbSxpM2MtbWFzdGVyLnlhbWwKPj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmFkNjNlYTc3OWZkNgo+
Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kzYy9xY29tLGkzYy1tYXN0ZXIueWFtbAo+Pgo+PiBGaWxlbmFtZSBtYXRjaGluZyBjb21w
YXRpYmxlLgo+Pgo+IENoYW5nZWQgY29tcGF0aWJsZSB0byAicWNvbSxpM2MtbWFzdGVyIgo+Pj4g
QEAgLTAsMCArMSw1NyBAQAo+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
T1IgQlNELTItQ2xhdXNlCj4+PiArJVlBTUwgMS4yCj4+PiArLS0tCj4+PiArJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pM2MvcWNvbSxpM2MtbWFzdGVyLnlhbWwjCj4+PiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+PiAr
Cj4+PiArdGl0bGU6IFF1YWxjb21tIEkzQyBtYXN0ZXIgY29udHJvbGxlcgo+Pj4gKwo+Pj4gK21h
aW50YWluZXJzOgo+Pj4gK8KgIC0gTXVrZXNoIEt1bWFyIFNhdmFsaXlhIDxxdWljX21zYXZhbGl5
QHF1aWNpbmMuY29tPgo+Pj4gKwo+Pj4gK2FsbE9mOgo+Pj4gK8KgIC0gJHJlZjogaTNjLnlhbWwj
Cj4+PiArCj4+PiArcHJvcGVydGllczoKPj4+ICvCoCBjb21wYXRpYmxlOgo+Pj4gK8KgwqDCoCBj
b25zdDogcWNvbSxnZW5pLWkzYwo+Pgo+PiBObyBTb0M/IFNvIHRvIGJlIHN1cmU6IHlvdSBjbGFp
bSBhbGwgZnV0dXJlIFNvQ3Mgd2lsbCBiZSB1c2luZyBleGFjdGx5Cj4+IHRoZSBzYW1lIGludGVy
ZmFjZS4gTm8gbmV3IGNvbXBhdGlibGVzLCBubyBuZXcgcHJvcGVydGllcyB3aWxsIGJlIGFkZGVk
Lgo+Pgo+IEkgdGhpbmsgaSBzaG91bGQgcmVtb3ZlIGNvbnN0LiBrZXB0IGl0IGZvciBub3cgYXMg
bm8gb3RoZXIgY29tcGF0aWJsZSB0byAKPiBiZSBhZGRlZCBhcyBvZiBub3cuCj4gCj4gbGV0IG1l
IHJlbW92ZSBjb25zdC4KPiAKPiBTb0MgbmFtZSBpcyBub3QgcmVxdWlyZWQsIGFzIHRoaXMgY29t
cGF0aWJsZSBpcyBnZW5lcmljIHRvIGFsbCB0aGUgU09Dcy4KPj4+ICsKPj4+ICvCoCByZWc6Cj4+
PiArwqDCoMKgIG1pbkl0ZW1zOiAxCj4+Cj4+IERyb3AKPj4KPiBOb3QgcmVxdWlyZWQgPyBJIHNl
ZSBvdGhlciBiaW5kaW5ncyBhcmUgdXNpbmcgaXQsIHNvIHBsZWFzZSBjb25maXJtIGlmIGkgCj4g
Y2FuIHJlbW92ZSB0aGlzLgo+Pj4gK8KgwqDCoCBtYXhJdGVtczogMgo+Pgo+PiBEcm9wIGFuZCBp
bnN0ZWFkIGxpc3QgYW5kIGRlc2NyaWJlIGl0ZW1zCj4+Cj4gT2theSwgaSBjYW4gcmVtb3ZlIG1h
eEl0ZW1zIGlmIG5vdCBtYW5kYXRvcnkuIFRha2VuIGNkbnMsaTNjLW1hc3Rlci55YW1sIAo+IGFu
ZCBhZGRlZCB0aGVzZS4KPiAKPj4KPj4+ICsKPj4+ICvCoCBjbG9ja3M6Cj4+PiArwqDCoMKgIG1p
bkl0ZW1zOiAxCj4+Cj4+IExvb2sgYXQgb3RoZXIgYmluZGluZ3MuIFRoZXJlIGlzIG5ldmVyIGNv
ZGUgbGlrZSB0aGlzLgo+Pgo+IGNkbnMsaTNjLW1hc3Rlci55YW1sIHRha2VuIGFzIHJlZmVyZW5j
ZS4KPj4+ICsKPj4+ICvCoCBjbG9jay1uYW1lczoKPj4+ICvCoMKgwqAgaXRlbXM6Cj4+PiArwqDC
oMKgwqDCoCAtIGNvbnN0OiBzZS1jbGsKPj4KPj4gRHJvcCBjbG9jay1uYW1lcwo+IFN1cmUsIHRv
b2sgcmVmZXJlbmNlIGZyb20gY2RucyxpM2MtbWFzdGVyLnlhbWwuCj4+Cj4+PiArCj4+PiArwqAg
aW50ZXJydXB0cy1leHRlbmRlZDoKPj4+ICvCoMKgwqAgbWluSXRlbXM6IDEKPj4+ICvCoMKgwqAg
bWF4SXRlbXM6IDMKPj4KPj4gQXMgd2VsbCAtIHRoZXJlIGlzIG5ldmVyIGFuIGludGVycnVwdHMt
ZXh0ZW5kZWQgcHJvcGVydHkuIEp1c3QgCj4+IGludGVycnVwdHMuCj4+Cj4gTm8sIGkgc2VlIHRo
aXMgcHJvcGVydHkgbWFueSBwbGFjZXMuIERvIHlvdSBtZWFuIHRvIHNheSBpbnRlcnJ1cHRzLSAK
PiBleHRlbmRlZMKgIGNhbiBiZSB0aGVyZSBpbiBleGFtcGxlcyBidXQgbm90IG9ubHkgYWRkICJp
bnRlcnJ1cHRzIiAKPiBwcm9wZXJ0eSBoZXJlID8KPiBlLmcgdGltZXIvcmlzY3YsdGltZXIueWFt
bCArNDEgbGlzdHMgaXQgaW4geWFtbCBhbHNvLgo+PiBBbHNvIGRyb3AgY29uc3RyYWludHMgYW5k
IGxpc3QgaXRlbXMuCj4+Cj4gSSB3aWxsIHJlbW92ZSBtaW5JdGVtcyBhbmQgTWF4SXRlbXMsIHdp
bGwgbGlzdCBJdGVtcyB3aXRoIGRlc2NyaXB0aW9uLgo+PgpXYW50ZWQgdG8gY2hlY2sgaWYgYmVs
b3cgd2F5IGlzIGZpbmUgPyBCZWNhdXNlIHNvbWUgb2YgdGhlIGFzayB0byBkcm9wIApjb25zdHJh
aW50cyBhcmUgYWxyZWFkeSBwcmVzZW50IGluIG90aGVyIGkzYyB5YW1sIGZpbGVzLgoKaWYgbm90
LCBjb3VsZCB5b3UgcGxlYXNlIGhlbHAgc2hhcmUgZXhhbXBsZSByZW1vdmluZyBjb25zdHJhaW50
cyBhbmQgCmxpc3RpbmcgaXRlbSA/Cgo9PSBTYW1wbGUgPT0KcHJvcGVydGllczoKICAgY29tcGF0
aWJsZToKICAgICBlbnVtOgogICAgICAgLSBxY29tLGkzYy1jb250cm9sbGVyCgogICByZWc6CiAg
ICAgdHlwZTogYXJyYXkKICAgICBtaW5JdGVtczogMQogICAgIG1heEl0ZW1zOiAxCiAgICAgaXRl
bXM6CiAgICAgICB0eXBlOiBpbnRlZ2VyCiAgICAgZGVzY3JpcHRpb246IEJhc2UgYWRkcmVzcyBh
bmQgc2l6ZSBvZiB0aGUgSTNDIGNvbnRyb2xsZXIgcmVnaXN0ZXJzLgoKICAgaW50ZXJydXB0czoK
ICAgICB0eXBlOiBhcnJheQogICAgIG1pbkl0ZW1zOiAxCiAgICAgbWF4SXRlbXM6IDEKICAgICBp
dGVtczoKICAgICAgIHR5cGU6IGludGVnZXIKICAgICBkZXNjcmlwdGlvbjogSW50ZXJydXB0IG51
bWJlciBmb3IgdGhlIEkzQyBjb250cm9sbGVyLgoKICAgY2xvY2tzOgogICAgIHR5cGU6IGFycmF5
CiAgICAgbWluSXRlbXM6IDEKICAgICBtYXhJdGVtczogMQogICAgIGl0ZW1zOgogICAgICAgdHlw
ZTogb2JqZWN0CiAgICAgZGVzY3JpcHRpb246IENsb2NrIHNwZWNpZmllciBmb3IgdGhlIEkzQyBj
b250cm9sbGVyLgo9PT0KCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4gCj4gCgoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
