Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46329E6C610
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Dec 2024 07:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoGese1P+9K4qvGFvWB39YftrTqugu/EyPIAATQUjWA=; b=ihCZMQIjFUPZYRee9OuX89Ot+R
	AGf+tSKsxLR4KROLKPssMwY2l8A0DM4MkCjrivMzBtnMWsk/d93DDX8LeVEH1L6MLO/OwGZybX0v8
	DEP7EbSM7H6AdvIGQXG6X0gtC12RmdDrGCRtyUavU8gx7rSQroLzw6CgbtH4YtY2xvozICy3Uzede
	YeWyKS8KIWfcg0K8NaLJ/D3sH9/YYwb3XBiexq1/8hiaCEFHaSr+9jnKaIBWkeSdIMorjz+v3ZV1O
	NNO3Ln7SkRqZw0LdxiHtzKXHZLrTNAGKsjA5e9maYHKUc0nHtbLri0bTlaHmvTOBaXlxYSMZNzZfU
	lNrvMLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINbs-00000008ZE3-0EAB;
	Tue, 03 Dec 2024 07:46:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINab-00000008YxZ-2DVK
	for linux-i3c@lists.infradead.org;
	Tue, 03 Dec 2024 07:44:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2J2uQY006231;
	Tue, 3 Dec 2024 07:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBSERF1R2TLD7Mt+VzBseXcJb6BWJVImVrmylYq2Gfo=; b=KWSI4pA5GaOH+ML4
	DqyLiwyfVoyN9fW4kzB0nLy45WP7joPlSDsK8F0ewQKcANXajdETAYzJlnz4ho4F
	ozuyz2bSVxlOlWjKsRodx22MHNdqWWZn/d0gC1xZEReIyiYruMNMbNBy59c69tXW
	RjfWV1z+hl5M8t+WlwCgGI1n5FDhmEk6vofLqiz2RPLDrP9RbDqCaIQwRk/5blAW
	RMHdz4FdYX1m9lcbohaYu2AAjqBYJa2AVzuS9G29mbUDwRJPlqicNe/32XmdNyFN
	wsKh2HrF0Isele89zozNiBiOjoKzGXZrIXqvuSWVhzHOPazw9/tqZM/Vo+TzI9Ye
	5sVcfw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1gfchc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 07:44:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B37io2Z001827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 07:44:50 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 23:44:49 -0800
Message-ID: <4cecd65a-02c4-4a67-b209-0ec90ae02cb1@quicinc.com>
Date: Tue, 3 Dec 2024 13:14:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: dw: Fix use-after-free in dw_i3c_master driver due
 to race condition
To: Pei Xiao <xiaopei01@kylinos.cn>, <linux-i3c@lists.infradead.org>,
        <frank.li@nxp.com>
References: <bfc49c9527be5b513e7ceafeba314ca40a5be4bc.1732703537.git.xiaopei01@kylinos.cn>
 <2cc88393-d051-4626-87b7-1ea6c532ae61@quicinc.com>
 <15edf6df-3b13-4c72-a9c8-7c87d8578c4d@kylinos.cn>
 <1d5e7370-3913-416c-80f9-0e8ce459d761@quicinc.com>
 <8c20ba3f-d214-428c-a827-7642d85bec87@kylinos.cn>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <8c20ba3f-d214-428c-a827-7642d85bec87@kylinos.cn>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ao8dIbTVHVk9d1De5ore7t4wZDsNmIUq
X-Proofpoint-ORIG-GUID: Ao8dIbTVHVk9d1De5ore7t4wZDsNmIUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_234457_684016_F9AB1522 
X-CRM114-Status: GOOD (  15.75  )
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

VGhhbmtzIFBlaSAhCgpPbiAxMi8zLzIwMjQgMTI6NTMgUE0sIFBlaSBYaWFvIHdyb3RlOgo+IAo+
IAo+IOWcqCAyMDI0LzEyLzMgMTU6MTIsIE11a2VzaCBLdW1hciBTYXZhbGl5YSDlhpnpgZM6Cj4+
IEhpIFBlaSwgUGxlYXNlIERvbid0IHRvcCBwb3N0IHRoZSBjb21tZW50Lgo+IHNvIHNvcnJ5IGZv
ciB0aGF0IQo+Pgo+PiBPbiAxMi8zLzIwMjQgMTI6MzUgUE0sIFBlaSBYaWFvIHdyb3RlOgo+Pj4g
SGksCj4+PiDCoMKgIEkgZG9uJ3QgdGhpbmtzIHNvLkhlcmUgaXMgYSBkZXNjcmlwdGlvbiBvZiBj
YW5jZWxfd29ya19zeW5jLgo+Pj4gwqDCoCAqd29yayBpcyBndWFyYW50ZWVkIHRvIGJlIG5vdCBw
ZW5kaW5nIG9yIGV4ZWN1dGluZyBvbiBhbnkgQ1BVKi4KPj4+Cj4+Pgo+Pj4gY2FuY2VsX3dvcmtf
c3luYyDigJQgY2FuY2VsIGEgd29yayBhbmQgd2FpdCBmb3IgaXQgdG8gZmluaXNoCj4+PiBTeW5v
cHNpcwo+Pj4gYm9vbCBjYW5jZWxfd29ya19zeW5jICjCoMKgwqAgc3RydWN0IHdvcmtfc3RydWN0
ICogd29yayk7Cj4+Pgo+Pj4gQXJndW1lbnRzCj4+Pgo+Pj4gd29yawo+Pj4KPj4+IMKgwqDCoMKg
IHRoZSB3b3JrIHRvIGNhbmNlbAo+Pj4KPj4+IERlc2NyaXB0aW9uCj4+Pgo+Pj4gQ2FuY2VsIHdv
cmsgYW5kIHdhaXQgZm9yIGl0cyBleGVjdXRpb24gdG8gZmluaXNoLiBUaGlzIGZ1bmN0aW9uIGNh
biAKPj4+IGJlIHVzZWQgZXZlbiBpZiB0aGUgd29yayByZS1xdWV1ZXMgaXRzZWxmIG9yIG1pZ3Jh
dGVzIHRvIGFub3RoZXIgCj4+PiB3b3JrcXVldWUuIE9uIHJldHVybiBmcm9tIHRoaXMgZnVuY3Rp
b24sIHdvcmsgaXMgZ3VhcmFudGVlZCB0byBiZSBub3QgCj4+PiBwZW5kaW5nIG9yIGV4ZWN1dGlu
ZyBvbiBhbnkgQ1BVLgo+Pj4KPj4+IGNhbmNlbF93b3JrX3N5bmMoZGVsYXllZF93b3JrLT53b3Jr
KSBtdXN0IG5vdCBiZSB1c2VkIGZvciAKPj4+IGRlbGF5ZWRfd29yaydzLiBVc2UgY2FuY2VsX2Rl
bGF5ZWRfd29ya19zeW5jIGluc3RlYWQuCj4+Pgo+Pj4gVGhlIGNhbGxlciBtdXN0IGVuc3VyZSB0
aGF0IHRoZSB3b3JrcXVldWUgb24gd2hpY2ggd29yayB3YXMgbGFzdCAKPj4+IHF1ZXVlZCBjYW4n
dCBiZSBkZXN0cm95ZWQgYmVmb3JlIHRoaXMgZnVuY3Rpb24gcmV0dXJucy4KPj4+IFJldHVybgo+
Pj4KPj4+IHRydWUgaWYgd29yayB3YXMgcGVuZGluZywgZmFsc2Ugb3RoZXJ3aXNlLgo+Pj4KPj4+
IFRoYW5rcyEKPj4+IFBlaS4KPj4+IOWcqCAyMDI0LzEyLzMgMTQ6NDksIE11a2VzaCBLdW1hciBT
YXZhbGl5YSDlhpnpgZM6Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDExLzI4LzIwMjQgNzoyOSBBTSwgUGVp
IFhpYW8gd3JvdGU6Cj4+Pj4+IEluIGR3X2kzY19jb21tb25fcHJvYmUsICZtYXN0ZXItPmhqX3dv
cmsgaXMgYm91bmQgd2l0aAo+Pj4+PiBkd19pM2NfaGpfd29yay4gQW5kIGR3X2kzY19tYXN0ZXJf
aXJxX2hhbmRsZXIgY2FuIGNhbGwKPj4+Pj4gZHdfaTNjX21hc3Rlcl9pcnFfaGFuZGxlX2liaXMg
ZnVuY3Rpb24gdG8gc3RhcnQgdGhlIHdvcmsuCj4+Pj4+Cj4+Pj4+IElmIHdlIHJlbW92ZSB0aGUg
bW9kdWxlIHdoaWNoIHdpbGwgY2FsbCBkd19pM2NfY29tbW9uX3JlbW92ZSB0bwo+Pj4+PiBtYWtl
IGNsZWFudXAsIGl0IHdpbGwgZnJlZSBtYXN0ZXItPmJhc2UgdGhyb3VnaCBpM2NfbWFzdGVyX3Vu
cmVnaXN0ZXIKPj4+Pj4gd2hpbGUgdGhlIHdvcmsgbWVudGlvbmVkIGFib3ZlIHdpbGwgYmUgdXNl
ZC4gVGhlIHNlcXVlbmNlIG9mIAo+Pj4+PiBvcGVyYXRpb25zCj4+Pj4+IHRoYXQgbWF5IGxlYWQg
dG8gYSBVQUYgYnVnIGlzIGFzIGZvbGxvd3M6Cj4+Pj4+Cj4+Pj4+IENQVTDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBDUFUxCj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgZHdfaTNjX2hqX3dvcmsK
Pj4+Pj4gZHdfaTNjX2NvbW1vbl9yZW1vdmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8Cj4+Pj4+IGkzY19tYXN0ZXJfdW5yZWdpc3RlcigmbWFzdGVyLT5iYXNlKSB8Cj4+Pj4+IGRl
dmljZV91bnJlZ2lzdGVyKCZtYXN0ZXItPmRldinCoMKgwqDCoMKgIHwKPj4+Pj4gZGV2aWNlX3Jl
bGVhc2XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+Pj4+
IC8vZnJlZSBtYXN0ZXItPmJhc2XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwK
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBpM2NfbWFzdGVyX2RvX2RhYSgmbWFzdGVyLSAKPj4+
Pj4gPmJhc2UpCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgLy91c2UgbWFzdGVyLT5iYXNlCj4+
Pj4+Cj4+Pj4+IEZpeCBpdCBieSBlbnN1cmluZyB0aGF0IHRoZSB3b3JrIGlzIGNhbmNlbGVkIGJl
Zm9yZSBwcm9jZWVkaW5nIHdpdGgKPj4+Pj4gdGhlIGNsZWFudXAgaW4gZHdfaTNjX2NvbW1vbl9y
ZW1vdmUuCj4+Pj4+Cj4+Pj4+IEZpeGVzOiAxZGQ3MjhmNWQ0ZDQgKCJpM2M6IG1hc3RlcjogQWRk
IGRyaXZlciBmb3IgU3lub3BzeXMgCj4+Pj4+IERlc2lnbldhcmUgSVAiKQpBY2tlZC1ieTogTXVr
ZXNoIEt1bWFyIFNhdmFsaXlhIDxxdWljX21zYXZhbGl5QHF1aWNpbmMuY29tPgo+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBQZWkgWGlhbyA8eGlhb3BlaTAxQGt5bGlub3MuY24+Cj4+Pj4+IC0tLQo+Pj4+
PiDCoCBkcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIHwgMSArCj4+Pj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjLyAKPj4+Pj4gbWFz
dGVyLyBkdy1pM2MtbWFzdGVyLmMKPj4+Pj4gaW5kZXggOGQ2OTQ2NzJjMTEwLi5kYmNkMzk4NGYy
NTcgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMK
Pj4+Pj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+Pj4+PiBAQCAt
MTYyNCw2ICsxNjI0LDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZHdfaTNjX2NvbW1vbl9wcm9iZSk7
Cj4+Pj4+IMKgIHZvaWQgZHdfaTNjX2NvbW1vbl9yZW1vdmUoc3RydWN0IGR3X2kzY19tYXN0ZXIg
Km1hc3RlcikKPj4+Pj4gwqAgewo+Pj4+PiArwqDCoMKgIGNhbmNlbF93b3JrX3N5bmMoJm1hc3Rl
ci0+aGpfd29yayk7Cj4+Pj4gWW91IHN0aWxsIG5lZWQgdG8gY2FwdHVyZSByZXR1cm4gYW5kIGVu
c3VyZSB0aGF0IHRoZSBwZW5kaW5nIHdvcmsgaXMgCj4+Pj4gcmVhbGx5IGNvbXBsZXRlZCBvciBu
byBtb3JlIHBlbmRpbmcuCj4+IFJldHVybiA6IHRydWUgaWYgd29yayB3YXMgcGVuZGluZywgZmFs
c2Ugb3RoZXJ3aXNlCj4+IFdvdWxkIGxpa2UgdG8gY2FwdHVyZSB0aGUgcmV0dXJuIGFuZCBub3Rp
ZnkvcHJpbnQgPwo+IHdoZW4gSSBncmVwICJjYW5jZWxfd29ya19zeW5jIiAtbnIgZHJpdmVyLyxh
bG1vc3Qgbm8gdXNlIG9mIHRoaXMgcmV0dXJuIAo+IHZhbHVlIGluIGRyaXZlci4KPiAKU3VyZSwg
bG9va3MgZmluZSB0byBtZS4KPiBUaGFua3MhCj4gUGVpLgo+IAo+Pj4+PiDCoMKgwqDCoMKgIGkz
Y19tYXN0ZXJfdW5yZWdpc3RlcigmbWFzdGVyLT5iYXNlKTsKPj4+Pj4gwqDCoMKgwqDCoCBwbV9y
dW50aW1lX2Rpc2FibGUobWFzdGVyLT5kZXYpOwo+Pj4+Cj4+Pj4KPj4KPj4KCgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
