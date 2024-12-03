Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB36E6C60F
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Dec 2024 07:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIffOQzU+XXMkeLuv2aplWG+iPurJbdeOmM+FC6gDAc=; b=MG5XcqA2910DJxVezlqIC8V82o
	wol3K/i2DJt4TCNMf+2g6x5isZkWFFUlNv0XUF8ZlKvqz1iMuE7jUQnZLjDLjJJ4OlblIRsySn0dL
	1lwRZYXo/1uAgWw4ccx02qPCEetk+50bHQfG/I897Ug/lPTtwVnM7HmO8ViIiQz6H/nH+APZCrQ4w
	P+Lz/kW1iWeauMrXlaN3YoJqVeWb/yqmFTE8XqxaEGAQ9slUZnRQwhYO7PjA8W/na1pLzUj7xB0KO
	pP3KFbTZx5JKv8WNnhqQS2sjJC7y5nzGszqZKXsHtTlqT729V5eNd5KGUV2FAoLPUk/Akcj6dWBUX
	X2Ibfcjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIN5G-00000008TxB-1MWY;
	Tue, 03 Dec 2024 07:12:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIN5D-00000008Twg-24zJ
	for linux-i3c@lists.infradead.org;
	Tue, 03 Dec 2024 07:12:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2J2uNX006231;
	Tue, 3 Dec 2024 07:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YBGnPdYSD0fbgpq/9hdwXGuAbbaJPttyLaHgas39iL0=; b=oOEAgj3UhAXvvqFS
	Af3pxMabuhq/FUk3l5d7cADPlYB2LAL2H7J+nlrqVFlfjWcMvJvwBz2HQUjqZiUX
	ud60ZbOYK2QFpnB8ewOGS440mjOTu9xNU9SwVjfZ43OAZzAYYdIekACaYMB50j7g
	7N+Y/trEBzqIh8iqoPwU3UqK54+35Tbby/gq54RUB/UzEzWgTznGKtSsqwS99CSB
	Adu9vPDGeTqCcFHkhv/0slugDfPVgo4yjgF4iHWs1WmJC0E/F/41DeUL7PHICxFg
	M5Eel+Ap1qg0uK4dRSqjkNN4j2NBbhynTmUQxHj8SDHzHQozYxfiv0nsZ1o/SuN0
	nKpkoQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437t1gfa7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 07:12:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B37CODo030402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 07:12:24 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 23:12:23 -0800
Message-ID: <1d5e7370-3913-416c-80f9-0e8ce459d761@quicinc.com>
Date: Tue, 3 Dec 2024 12:42:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: dw: Fix use-after-free in dw_i3c_master driver due
 to race condition
To: Pei Xiao <xiaopei01@kylinos.cn>, <linux-i3c@lists.infradead.org>,
        <frank.li@nxp.com>
References: <bfc49c9527be5b513e7ceafeba314ca40a5be4bc.1732703537.git.xiaopei01@kylinos.cn>
 <2cc88393-d051-4626-87b7-1ea6c532ae61@quicinc.com>
 <15edf6df-3b13-4c72-a9c8-7c87d8578c4d@kylinos.cn>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <15edf6df-3b13-4c72-a9c8-7c87d8578c4d@kylinos.cn>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kIadp3RHc9QrZHrW1-cwHokIFMk3TJdv
X-Proofpoint-ORIG-GUID: kIadp3RHc9QrZHrW1-cwHokIFMk3TJdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_231231_657924_1A2D5432 
X-CRM114-Status: GOOD (  20.13  )
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

SGkgUGVpLCBQbGVhc2UgRG9uJ3QgdG9wIHBvc3QgdGhlIGNvbW1lbnQuCgpPbiAxMi8zLzIwMjQg
MTI6MzUgUE0sIFBlaSBYaWFvIHdyb3RlOgo+IEhpLAo+ICDCoCBJIGRvbid0IHRoaW5rcyBzby5I
ZXJlIGlzIGEgZGVzY3JpcHRpb24gb2YgY2FuY2VsX3dvcmtfc3luYy4KPiAgwqAgKndvcmsgaXMg
Z3VhcmFudGVlZCB0byBiZSBub3QgcGVuZGluZyBvciBleGVjdXRpbmcgb24gYW55IENQVSouCj4g
Cj4gCj4gY2FuY2VsX3dvcmtfc3luYyDigJQgY2FuY2VsIGEgd29yayBhbmQgd2FpdCBmb3IgaXQg
dG8gZmluaXNoCj4gU3lub3BzaXMKPiBib29sIGNhbmNlbF93b3JrX3N5bmMgKMKgwqDCoCBzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKiB3b3JrKTsKPiAKPiBBcmd1bWVudHMKPiAKPiB3b3JrCj4gCj4gIMKg
wqDCoCB0aGUgd29yayB0byBjYW5jZWwKPiAKPiBEZXNjcmlwdGlvbgo+IAo+IENhbmNlbCB3b3Jr
IGFuZCB3YWl0IGZvciBpdHMgZXhlY3V0aW9uIHRvIGZpbmlzaC4gVGhpcyBmdW5jdGlvbiBjYW4g
YmUgCj4gdXNlZCBldmVuIGlmIHRoZSB3b3JrIHJlLXF1ZXVlcyBpdHNlbGYgb3IgbWlncmF0ZXMg
dG8gYW5vdGhlciB3b3JrcXVldWUuIAo+IE9uIHJldHVybiBmcm9tIHRoaXMgZnVuY3Rpb24sIHdv
cmsgaXMgZ3VhcmFudGVlZCB0byBiZSBub3QgcGVuZGluZyBvciAKPiBleGVjdXRpbmcgb24gYW55
IENQVS4KPiAKPiBjYW5jZWxfd29ya19zeW5jKGRlbGF5ZWRfd29yay0+d29yaykgbXVzdCBub3Qg
YmUgdXNlZCBmb3IgCj4gZGVsYXllZF93b3JrJ3MuIFVzZSBjYW5jZWxfZGVsYXllZF93b3JrX3N5
bmMgaW5zdGVhZC4KPiAKPiBUaGUgY2FsbGVyIG11c3QgZW5zdXJlIHRoYXQgdGhlIHdvcmtxdWV1
ZSBvbiB3aGljaCB3b3JrIHdhcyBsYXN0IHF1ZXVlZCAKPiBjYW4ndCBiZSBkZXN0cm95ZWQgYmVm
b3JlIHRoaXMgZnVuY3Rpb24gcmV0dXJucy4KPiBSZXR1cm4KPiAKPiB0cnVlIGlmIHdvcmsgd2Fz
IHBlbmRpbmcsIGZhbHNlIG90aGVyd2lzZS4KPiAKPiBUaGFua3MhCj4gUGVpLgo+IOWcqCAyMDI0
LzEyLzMgMTQ6NDksIE11a2VzaCBLdW1hciBTYXZhbGl5YSDlhpnpgZM6Cj4+Cj4+Cj4+IE9uIDEx
LzI4LzIwMjQgNzoyOSBBTSwgUGVpIFhpYW8gd3JvdGU6Cj4+PiBJbiBkd19pM2NfY29tbW9uX3By
b2JlLCAmbWFzdGVyLT5oal93b3JrIGlzIGJvdW5kIHdpdGgKPj4+IGR3X2kzY19oal93b3JrLiBB
bmQgZHdfaTNjX21hc3Rlcl9pcnFfaGFuZGxlciBjYW4gY2FsbAo+Pj4gZHdfaTNjX21hc3Rlcl9p
cnFfaGFuZGxlX2liaXMgZnVuY3Rpb24gdG8gc3RhcnQgdGhlIHdvcmsuCj4+Pgo+Pj4gSWYgd2Ug
cmVtb3ZlIHRoZSBtb2R1bGUgd2hpY2ggd2lsbCBjYWxsIGR3X2kzY19jb21tb25fcmVtb3ZlIHRv
Cj4+PiBtYWtlIGNsZWFudXAsIGl0IHdpbGwgZnJlZSBtYXN0ZXItPmJhc2UgdGhyb3VnaCBpM2Nf
bWFzdGVyX3VucmVnaXN0ZXIKPj4+IHdoaWxlIHRoZSB3b3JrIG1lbnRpb25lZCBhYm92ZSB3aWxs
IGJlIHVzZWQuIFRoZSBzZXF1ZW5jZSBvZiBvcGVyYXRpb25zCj4+PiB0aGF0IG1heSBsZWFkIHRv
IGEgVUFGIGJ1ZyBpcyBhcyBmb2xsb3dzOgo+Pj4KPj4+IENQVTDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBD
UFUxCj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBkd19pM2NfaGpfd29yawo+Pj4gZHdfaTNj
X2NvbW1vbl9yZW1vdmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+PiBpM2Nf
bWFzdGVyX3VucmVnaXN0ZXIoJm1hc3Rlci0+YmFzZSkgfAo+Pj4gZGV2aWNlX3VucmVnaXN0ZXIo
Jm1hc3Rlci0+ZGV2KcKgwqDCoMKgwqAgfAo+Pj4gZGV2aWNlX3JlbGVhc2XCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+PiAvL2ZyZWUgbWFzdGVyLT5iYXNl
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IGkzY19tYXN0ZXJfZG9fZGFhKCZtYXN0ZXItPmJhc2UpCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IC8vdXNlIG1hc3Rlci0+YmFzZQo+Pj4KPj4+IEZpeCBpdCBieSBlbnN1cmluZyB0aGF0IHRo
ZSB3b3JrIGlzIGNhbmNlbGVkIGJlZm9yZSBwcm9jZWVkaW5nIHdpdGgKPj4+IHRoZSBjbGVhbnVw
IGluIGR3X2kzY19jb21tb25fcmVtb3ZlLgo+Pj4KPj4+IEZpeGVzOiAxZGQ3MjhmNWQ0ZDQgKCJp
M2M6IG1hc3RlcjogQWRkIGRyaXZlciBmb3IgU3lub3BzeXMgRGVzaWduV2FyZSAKPj4+IElQIikK
Pj4+IFNpZ25lZC1vZmYtYnk6IFBlaSBYaWFvIDx4aWFvcGVpMDFAa3lsaW5vcy5jbj4KPj4+IC0t
LQo+Pj4gwqAgZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyB8IDEgKwo+Pj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvIAo+Pj4g
ZHctaTNjLW1hc3Rlci5jCj4+PiBpbmRleCA4ZDY5NDY3MmMxMTAuLmRiY2QzOTg0ZjI1NyAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPj4+ICsrKyBi
L2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPj4+IEBAIC0xNjI0LDYgKzE2MjQs
NyBAQCBFWFBPUlRfU1lNQk9MX0dQTChkd19pM2NfY29tbW9uX3Byb2JlKTsKPj4+IMKgIHZvaWQg
ZHdfaTNjX2NvbW1vbl9yZW1vdmUoc3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3RlcikKPj4+IMKg
IHsKPj4+ICvCoMKgwqAgY2FuY2VsX3dvcmtfc3luYygmbWFzdGVyLT5oal93b3JrKTsKPj4gWW91
IHN0aWxsIG5lZWQgdG8gY2FwdHVyZSByZXR1cm4gYW5kIGVuc3VyZSB0aGF0IHRoZSBwZW5kaW5n
IHdvcmsgaXMgCj4+IHJlYWxseSBjb21wbGV0ZWQgb3Igbm8gbW9yZSBwZW5kaW5nLgpSZXR1cm4g
OiB0cnVlIGlmIHdvcmsgd2FzIHBlbmRpbmcsIGZhbHNlIG90aGVyd2lzZQpXb3VsZCBsaWtlIHRv
IGNhcHR1cmUgdGhlIHJldHVybiBhbmQgbm90aWZ5L3ByaW50ID8KPj4+IMKgwqDCoMKgwqAgaTNj
X21hc3Rlcl91bnJlZ2lzdGVyKCZtYXN0ZXItPmJhc2UpOwo+Pj4gwqDCoMKgwqDCoCBwbV9ydW50
aW1lX2Rpc2FibGUobWFzdGVyLT5kZXYpOwo+Pgo+PgoKCi0tIApsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
