Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A434E77197
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jan 2025 08:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYhAfqLWKsAa0g9h2AVDb2vIhHAC6mi9+qD+0iLqY90=; b=qDgE2MW2xd0mysBonRR1QGwYEE
	5sTQTCLnCKfJZFaH65C6XUmo0pPzukZyPoHYZ6TYFJbhj5hA4nlXE1VhPmosoDB0060bccW8DoC+P
	9rQzu/CQtsSp1D4OfmlUjNdsIYj7banDs7z8g8Zu5tY/NiaPpJMfPZKUTJ9vJ58I2mt+zt+EiiXzT
	4roVr3t2SY53Y8YDa5e4iVsRbtk8InVdsRCBl8/eSr28R9s3suoJDmzVLv+2Is8QwAvkwHmT+c0SE
	w+mbbt2TJx5MINR/F10IYcgVsT3eQeHJaHqfmqVqmeIrWqp312ymlI4Ju1tX8GUaa4Qbcwu6pLtxy
	MY7Wq5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoEq-0000000BDf8-3vqh;
	Thu, 09 Jan 2025 08:50:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoEn-0000000BDdf-1Qkw
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jan 2025 08:49:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5096qVEX009859;
	Thu, 9 Jan 2025 08:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2NzPeeb5+2Lv/imeuKi4RqBMuVQmmlUiWUVbd7CKT0=; b=n95fRjS2f7+MQnzD
	vAJ2mS0dHERfVlk3PeUJFZFL07FJyz272r6vThDTYR5nwLiRSfBEkS3odT8zqkuc
	Tj2ZKMXhA5F83vFkDRHAfJGZzbTgT1MVhfZZYR/vOTD1F80ebgrA3WSzgIEr2EzH
	jBt0fYqG1OolRkuaCcuFwisc9Bz8OLLv5FAiPe+1ybqQcHexfq2/Gim3Qt5Zu/Tz
	bliVKHwiT09B52XK7vQvk1EJIdKOaZuhwere8YEHqv4sC1NN+Ka02G8OLkSp9NJ+
	7saBafjXMHhTcJhwXZXChLnnjtIF4UU2M/3vlw2z9L7yEGd2Ul1PSdrFnLIU7FUr
	rYU8xw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429jt894v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 08:49:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5098noem024493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 08:49:51 GMT
Received: from [10.216.26.158] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 00:49:49 -0800
Message-ID: <c730e517-2c9b-49ff-8926-33b18e6e8df9@quicinc.com>
Date: Thu, 9 Jan 2025 14:19:45 +0530
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
 <c6fd8540-14f6-414a-95bd-a9fdac6812d7@kylinos.cn>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <c6fd8540-14f6-414a-95bd-a9fdac6812d7@kylinos.cn>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yok6w9dxYgCPk1l5E9KG6_Yd19SRsl2S
X-Proofpoint-GUID: yok6w9dxYgCPk1l5E9KG6_Yd19SRsl2S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_004957_383068_D48D8342 
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

CgpPbiAxLzkvMjAyNSAyOjA4IFBNLCBQZWkgWGlhbyB3cm90ZToKPiAKPiDlnKggMjAyNC8xMi8z
IDE1OjIzLCBQZWkgWGlhbyDlhpnpgZM6Cj4+Cj4+Cj4+IOWcqCAyMDI0LzEyLzMgMTU6MTIsIE11
a2VzaCBLdW1hciBTYXZhbGl5YSDlhpnpgZM6Cj4+PiBIaSBQZWksIFBsZWFzZSBEb24ndCB0b3Ag
cG9zdCB0aGUgY29tbWVudC4KPj4gc28gc29ycnkgZm9yIHRoYXQhCj4+Pgo+Pj4gT24gMTIvMy8y
MDI0IDEyOjM1IFBNLCBQZWkgWGlhbyB3cm90ZToKPj4+PiBIaSwKPj4+PiAgwqDCoCBJIGRvbid0
IHRoaW5rcyBzby5IZXJlIGlzIGEgZGVzY3JpcHRpb24gb2YgY2FuY2VsX3dvcmtfc3luYy4KPj4+
PiAgwqDCoCAqd29yayBpcyBndWFyYW50ZWVkIHRvIGJlIG5vdCBwZW5kaW5nIG9yIGV4ZWN1dGlu
ZyBvbiBhbnkgQ1BVKi4KPj4+Pgo+Pj4+Cj4+Pj4gY2FuY2VsX3dvcmtfc3luYyDigJQgY2FuY2Vs
IGEgd29yayBhbmQgd2FpdCBmb3IgaXQgdG8gZmluaXNoCj4+Pj4gU3lub3BzaXMKPj4+PiBib29s
IGNhbmNlbF93b3JrX3N5bmMgKMKgwqDCoCBzdHJ1Y3Qgd29ya19zdHJ1Y3QgKiB3b3JrKTsKPj4+
Pgo+Pj4+IEFyZ3VtZW50cwo+Pj4+Cj4+Pj4gd29yawo+Pj4+Cj4+Pj4gIMKgwqDCoMKgIHRoZSB3
b3JrIHRvIGNhbmNlbAo+Pj4+Cj4+Pj4gRGVzY3JpcHRpb24KPj4+Pgo+Pj4+IENhbmNlbCB3b3Jr
IGFuZCB3YWl0IGZvciBpdHMgZXhlY3V0aW9uIHRvIGZpbmlzaC4gVGhpcyBmdW5jdGlvbiBjYW4g
YmUgdXNlZCBldmVuIGlmIHRoZSB3b3JrIHJlLXF1ZXVlcyBpdHNlbGYgb3IgbWlncmF0ZXMgdG8g
YW5vdGhlciB3b3JrcXVldWUuIE9uIHJldHVybiBmcm9tIHRoaXMgZnVuY3Rpb24sIHdvcmsgaXMg
Z3VhcmFudGVlZCB0byBiZSBub3QgcGVuZGluZyBvciBleGVjdXRpbmcgb24gYW55IENQVS4KPj4+
Pgo+Pj4+IGNhbmNlbF93b3JrX3N5bmMoZGVsYXllZF93b3JrLT53b3JrKSBtdXN0IG5vdCBiZSB1
c2VkIGZvciBkZWxheWVkX3dvcmsncy4gVXNlIGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYyBpbnN0
ZWFkLgo+Pj4+Cj4+Pj4gVGhlIGNhbGxlciBtdXN0IGVuc3VyZSB0aGF0IHRoZSB3b3JrcXVldWUg
b24gd2hpY2ggd29yayB3YXMgbGFzdCBxdWV1ZWQgY2FuJ3QgYmUgZGVzdHJveWVkIGJlZm9yZSB0
aGlzIGZ1bmN0aW9uIHJldHVybnMuCj4+Pj4gUmV0dXJuCj4+Pj4KPj4+PiB0cnVlIGlmIHdvcmsg
d2FzIHBlbmRpbmcsIGZhbHNlIG90aGVyd2lzZS4KPj4+Pgo+Pj4+IFRoYW5rcyEKPj4+PiBQZWku
Cj4+Pj4g5ZyoIDIwMjQvMTIvMyAxNDo0OSwgTXVrZXNoIEt1bWFyIFNhdmFsaXlhIOWGmemBkzoK
Pj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMTEvMjgvMjAyNCA3OjI5IEFNLCBQZWkgWGlhbyB3cm90ZToK
Pj4+Pj4+IEluIGR3X2kzY19jb21tb25fcHJvYmUsICZtYXN0ZXItPmhqX3dvcmsgaXMgYm91bmQg
d2l0aAo+Pj4+Pj4gZHdfaTNjX2hqX3dvcmsuIEFuZCBkd19pM2NfbWFzdGVyX2lycV9oYW5kbGVy
IGNhbiBjYWxsCj4+Pj4+PiBkd19pM2NfbWFzdGVyX2lycV9oYW5kbGVfaWJpcyBmdW5jdGlvbiB0
byBzdGFydCB0aGUgd29yay4KPj4+Pj4+Cj4+Pj4+PiBJZiB3ZSByZW1vdmUgdGhlIG1vZHVsZSB3
aGljaCB3aWxsIGNhbGwgZHdfaTNjX2NvbW1vbl9yZW1vdmUgdG8KPj4+Pj4+IG1ha2UgY2xlYW51
cCwgaXQgd2lsbCBmcmVlIG1hc3Rlci0+YmFzZSB0aHJvdWdoIGkzY19tYXN0ZXJfdW5yZWdpc3Rl
cgo+Pj4+Pj4gd2hpbGUgdGhlIHdvcmsgbWVudGlvbmVkIGFib3ZlIHdpbGwgYmUgdXNlZC4gVGhl
IHNlcXVlbmNlIG9mIG9wZXJhdGlvbnMKPj4+Pj4+IHRoYXQgbWF5IGxlYWQgdG8gYSBVQUYgYnVn
IGlzIGFzIGZvbGxvd3M6Cj4+Pj4+Pgo+Pj4+Pj4gQ1BVMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIENQVTEK
Pj4+Pj4+Cj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBkd19pM2NfaGpfd29yawo+Pj4+Pj4g
ZHdfaTNjX2NvbW1vbl9yZW1vdmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+
Pj4+PiBpM2NfbWFzdGVyX3VucmVnaXN0ZXIoJm1hc3Rlci0+YmFzZSkgfAo+Pj4+Pj4gZGV2aWNl
X3VucmVnaXN0ZXIoJm1hc3Rlci0+ZGV2KcKgwqDCoMKgwqAgfAo+Pj4+Pj4gZGV2aWNlX3JlbGVh
c2XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+Pj4+PiAv
L2ZyZWUgbWFzdGVyLT5iYXNlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBpM2NfbWFzdGVyX2RvX2RhYSgmbWFzdGVyLT5iYXNl
KQo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgLy91c2UgbWFzdGVyLT5iYXNlCj4+Pj4+Pgo+
Pj4+Pj4gRml4IGl0IGJ5IGVuc3VyaW5nIHRoYXQgdGhlIHdvcmsgaXMgY2FuY2VsZWQgYmVmb3Jl
IHByb2NlZWRpbmcgd2l0aAo+Pj4+Pj4gdGhlIGNsZWFudXAgaW4gZHdfaTNjX2NvbW1vbl9yZW1v
dmUuCj4+Pj4+Pgo+Pj4+Pj4gRml4ZXM6IDFkZDcyOGY1ZDRkNCAoImkzYzogbWFzdGVyOiBBZGQg
ZHJpdmVyIGZvciBTeW5vcHN5cyBEZXNpZ25XYXJlIElQIikKPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IFBlaSBYaWFvIDx4aWFvcGVpMDFAa3lsaW5vcy5jbj4KPj4+Pj4+IC0tLQo+Pj4+Pj4gIMKgIGRy
aXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgfCAxICsKPj4+Pj4+ICDCoCAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci8gZHctaTNj
LW1hc3Rlci5jCj4+Pj4+PiBpbmRleCA4ZDY5NDY3MmMxMTAuLmRiY2QzOTg0ZjI1NyAxMDA2NDQK
Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPj4+Pj4+ICsr
KyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPj4+Pj4+IEBAIC0xNjI0LDYg
KzE2MjQsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChkd19pM2NfY29tbW9uX3Byb2JlKTsKPj4+Pj4+
ICDCoCB2b2lkIGR3X2kzY19jb21tb25fcmVtb3ZlKHN0cnVjdCBkd19pM2NfbWFzdGVyICptYXN0
ZXIpCj4+Pj4+PiAgwqAgewo+Pj4+Pj4gK8KgwqDCoCBjYW5jZWxfd29ya19zeW5jKCZtYXN0ZXIt
PmhqX3dvcmspOwo+Pj4+PiBZb3Ugc3RpbGwgbmVlZCB0byBjYXB0dXJlIHJldHVybiBhbmQgZW5z
dXJlIHRoYXQgdGhlIHBlbmRpbmcgd29yayBpcyByZWFsbHkgY29tcGxldGVkIG9yIG5vIG1vcmUg
cGVuZGluZy4KPj4+IFJldHVybiA6IHRydWUgaWYgd29yayB3YXMgcGVuZGluZywgZmFsc2Ugb3Ro
ZXJ3aXNlCj4+PiBXb3VsZCBsaWtlIHRvIGNhcHR1cmUgdGhlIHJldHVybiBhbmQgbm90aWZ5L3By
aW50ID8KPj4gd2hlbiBJIGdyZXAgImNhbmNlbF93b3JrX3N5bmMiIC1uciBkcml2ZXIvLGFsbW9z
dCBubyB1c2Ugb2YgdGhpcyByZXR1cm4gdmFsdWUgaW4gZHJpdmVyLgo+Pgo+IElzIHRoZXJlIGFu
eSBpc3N1ZSB3aXRoIHRoaXMgcGF0Y2g/Cj4gCkxvb2tzIGZpbmUgdG8gbWUgYXMgdGhlcmUgaXMg
bm8gdXNlIG9mIHJldHVybiB2YWx1ZS4gQW5kIHlvdSBkb24ndCB3YW50IAp0byBwcmludCBmb3Ig
ZGVidWcgcHVycG9zZSBpIHRoaW5rLCBoZW5jZSBzaWduaW5nIG9mZi4KPiBUaGFua3MhCj4gCj4g
UGVpLgo+IAo+Pgo+Pj4+Pj4gIMKgwqDCoMKgwqAgaTNjX21hc3Rlcl91bnJlZ2lzdGVyKCZtYXN0
ZXItPmJhc2UpOwo+Pj4+Pj4gIMKgwqDCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKG1hc3Rlci0+
ZGV2KTsKPj4+Pj4KPj4+Pj4KPj4+Cj4+PgpBY2tlZC1ieTogTXVrZXNoIEt1bWFyIFNhdmFsaXlh
IDxxdWljX21zYXZhbGl5QHF1aWNpbmMuY29tPgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QK
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
