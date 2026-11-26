Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3FC606A31C
	for <linux-i3c@archiver.kernel.org>; Thu, 26 Nov 2026 19:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hmEMW2VO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HU3yp0eO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9R0T/Cs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y2wYPMhTLqmjacgI1rMSQP4WM+KNx42X8O+o2lIcuY0=; b=hmEMW2VOZ12SX16OFeyUl2Oq7q
	TVeyItMIF6+k6Z1toaengahWAMY9QYApJG1L1Lwvoml+ZuYhWXybN8HNhkFEENYeZszNXQCF9KTmJ
	I0sL2QU6I8Jy0UZ7hr7/P9ozIr01rqWOEbhXiIiV4qJfB/VzxnvMxzZQdcKAQeluh6jzJl6RTJzng
	x7Cb6wy2NChv8MLrsYpRO85VOEPkKKWs9XxYlEbMu8LGIcX9DzVHeZiXtZ7ieRXQT2O9HIVdKp8M/
	AlTZbjB4FAFu2EeFoGKBQoRqf6ZsvXZSg9l8/4UIwDmClb8ykj8JbUq1Vz9lZ8Q0IMmwiWkvgrDM0
	mZNJCBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfaa-0000000EPDP-0plZ;
	Thu, 26 Nov 2026 19:57:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfaX-0000000EPCq-188B
	for linux-i3c@lists.infradead.org;
	Thu, 26 Nov 2026 19:57:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGc7Es596658
	for <linux-i3c@lists.infradead.org>; Thu, 26 Nov 2026 19:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vld+0rqeif0m8EXLRjO64ItzG4+4lx/arBBDAlVUR/M=; b=HU3yp0eOOEwtjlzh
	1wqQR8lh1nlP5EXKXrVyS9PtLdM/3/bWtgZbEZ4w+rGKRWHYr6NcLTowTSS6gb59
	DGvhZY/xKof5Y0oquz4/oJIQn5HmEtUDtKoySLCj3132yv3eyFiHQ/Q+cwS2cqjk
	rBiP4pbjmsA0C9CAsJYBVuUkTeVsx3LRTptYynSYCP2NGwCpTx6T0Ev1jYcJ1I9e
	MnDqBshEfuXKKqDj/YHYqFyNWmW7CvUuN+ibwsLeDYZ0KIS+D1hscY6AnlaH5MlW
	2p1ewTQyCeJf+OsaIOwwTbbGCQ4XLcVHWWprQM6oDI0rX/wH0HfZp+8tknz/auTf
	wph/ZA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90hdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i3c@lists.infradead.org>; Thu, 26 Nov 2026 19:57:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so7321697eec.0
        for <linux-i3c@lists.infradead.org>; Thu, 26 Nov 2026 11:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795723020; x=1796327820; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vld+0rqeif0m8EXLRjO64ItzG4+4lx/arBBDAlVUR/M=;
        b=D9R0T/CsRe3WiIKpPaIUA86WbPe3mSpCDJi4zVN+SwMYcr5igmVLsQlr7GVcGT5UHw
         9Y7R9D1s3aISVKE/9Aei9S5AMcSAEWeU5nttcB5BB7pCyVNVUHjRmFIXqcolOmgzCh18
         47+0OO10j46iW2eZX3NbI/DNCJl9c6Z+FGs5sezOlQnw99MG4c+Tiz6VSPdjaVfT7/Rv
         Qa3QDFPbd9Z9OwCV7W/i0/O90+IUuoQagMJ0+x/WHZ8vxQeWYbKG/Vgd2RUGMBZPJbem
         oWayJ1y+GfoL4xZLNOLsjrvLzdqzuUcQahRdTXPWo2LIFrMGpAZ3m/8trZV4XxCHJVUY
         gOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795723020; x=1796327820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vld+0rqeif0m8EXLRjO64ItzG4+4lx/arBBDAlVUR/M=;
        b=k6pO1odhgZRg2bR4wJXzFMmijlXQFGuyemcGrVLRqHTdC7GZJtHNpeWFqPbOuSYV8P
         auD4mZcXb0rzJwmA+xa615n3W+v2chaFAZ4cveDjeho/QmXo4yiHqpaiA33RVC5MevDv
         kZ3pOppZKQV/KwgjkTj+hw7sNTOI5SD16f7CKnxepxj0mO5bXtG/9ZVxd8c7idppgKBc
         +MCbpl8rMSyDrMkeFBRwRePGiGXeRFAZ14PPPY7ZCbJEm5lchW6q+kSaO95ydwwgOhgW
         Y/LU4QaZN6kzqan3qmdcdXuOYX+1WP+0mY0t6OhixzYI3iO4Tv2UdR0SbP1jy86ymTDz
         gS/A==
X-Gm-Message-State: APuU4Z+4pE7GT9xrkf66mk+oKWTbI165hdtW+jcqD6gMb6uSUoh3B476
	D5l7DjFN2VTjFV26yfDwCv9uZv5LBqm4nnFXzaABp52MnpCykHD3v6Qr4/wsfzR+YRF3TMMnQoL
	CSRbsBnfNrVblj7QU5P836pzXDhVfZvtnUewOLhbkZL4vaGwrkP2OT/CP77PH9MBn5CEI1BRHrc
	01
X-Gm-Gg: AZFdTZfyE4Dmdw93p1wp4eQzY7iCbVR3fQpwwQ07BbMpKG4JJtdM3TEUz7t2Cm9x0i4
	4A/PQAWZaFgyjXVy99R3qQY7Qs/4Ksuq5sNQLEBzTJxSHG4pfNi4kHX4LxGNRmrMAxQbO7V+iRt
	68j5QS4epT0QdH0yF+qp6ahc8q78GP+wpNgnz2d7h2bRCdCCP5P+z4YmX+Y1f+S20E7mlMxBBF3
	l+oIrtutdjMQD4lP+GXztfmiVbjOakhHcwN1CotCpDDIRRDZN8/mel9lHM7MP1ITwBTB9U0/5aI
	N7Y2bIs5bdwdIOc82aGLP5Gn8Maq8wT7/VqgL/h30A6jEuhW4Jak22QEWXpN+AIp6qgyyDk+QR2
	i53tA/ssTO8n0ScKAPmbcbwc7RlLL1U6EtWzHNnNURvjzEukfkgf582YHvszlsxpQvos6X4jOy9
	MjDjXn
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr21732242eec.18.1795723019867;
        Thu, 26 Nov 2026 11:56:59 -0800 (PST)
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr21732214eec.18.1795723019233;
        Thu, 26 Nov 2026 11:56:59 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm32956181eec.27.2026.11.26.11.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:56:58 -0800 (PST)
Message-ID: <28bb4e7a-bee5-4e2f-9b1b-9e441b34c2ea@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 01:26:55 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: master: Disable slave events before RSTDAA
To: =?UTF-8?B?RGVmYSBMaSAo5p2O5b635Y+RKQ==?= <Defa.Li@mediatek.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
References: <6b079454.7734c9c0.2aca01.17e2SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <6b079454.7734c9c0.2aca01.17e2SMTPIN_ADDED_BROKEN@mx.google.com>
X-Proofpoint-ORIG-GUID: fzL-IZlfFQiyCdzobmAhJ3xnjcyKZJnJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3OCBTYWx0ZWRfXxivKabzfnWGr
 E8koNNOtFcxcfAy2ZVH+Unzor4fpuTbYLzzCLQCbR9iKlBbwjFQNx/2YaMctffM98trzB5XeoeL
 NhhcqkUo1z+9BF3hQNuzYWFltSUOYPx5GtZJSpL8EEzPqFRA+ct62AO8kk0aZtEHqUHuIWB8oy8
 e30xn6Ob50ym/0Uqa3TWCHWkMvYuLyhWpx0vLjXseA84diz7MedCAD/ks/33ypbZP7vTvlNMrYm
 GyYBVTIBzB8DSZhHmOp1gwPrNxXFApL7p4k5toyjQupQ9BiKOEsR68YURtxSXF6sUUlEkLrRX8k
 alVSiZ+COEI/qYHR7BN7ZdxzA6d5nN6TdWB2VOw31tfBQZxDxxMsBdo3/TRnblXqnqkzVVM2wCJ
 71J6q89kww6fA20Rs7rNLO3tDUta+cVruyC88F7cJ19GFVLWZi3Ym4itKbao7omNhka9QexZOkv
 aBX4VOhQKQJMFro+Ccg==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b088f0c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=5paVSw64R4kEUMRm3sSMUA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mpaa-ttXAAAA:8 a=vPkyzzX5k_SOGFXKYUEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3OCBTYWx0ZWRfXxd/kYCqqDawF
 JsbCgBH2Z64ct8IWPM5HWirqMZvNlaCACs0OcS8tld4xUyghcdFJKtnox1xfwv6gkJwiGhq1yPL
 S/wCs1CEeLlwtPZw3S5uI1rE0dmkaWA=
X-Proofpoint-GUID: fzL-IZlfFQiyCdzobmAhJ3xnjcyKZJnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_115701_314168_80F738B7 
X-CRM114-Status: GOOD (  30.32  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhvdWdoIGkgaGF2ZSByZXZpZXdlZCwgSSBkb24ndCBzZWUgeW91IGhhdmUgYWRkZWQgRnJhbmsg
YW5kIEFsZXhhbmRyZSAKd2hpbGUgcmVwbHlpbmcuIEkgYmVsaWV2ZSB0aGV5IHNob3VsZCBhZGQv
a2VlcCB0aGVtIHdoaWxlIHJlcGx5aW5nLgoKT24gMTEvMjYvMjAyNiA3OjM3IEFNLCBEZWZhIExp
ICjmnY7lvrflj5EpIHdyb3RlOgo+IEhpIE11a2VzaCwKPiAKPiBPbiBUaHUsIDIwMjYtMTEtMTkg
YXQgMTI6NDEgKzA1MzAsIE11a2VzaCBTYXZhbGl5YSB3cm90ZToKPj4gCj4+IEV4dGVybmFsIGVt
YWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGls
Cj4+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuCj4+IAo+PiAK
Pj4gT24gMTEvNi8yMDI2IDExOjUyIEFNLCBEZWZhIExpIHdyb3RlOgo+PiA+IEJ1cyBpbml0aWFs
aXphdGlvbiBzZW5kcyBSU1REQUEgYmVmb3JlIGRpc2FibGluZyBzbGF2ZSBldmVudHMuIEEKPj4g
PiBob3Qtam9pbgo+PiA+IG9yIG90aGVyIHNsYXZlIGV2ZW50IG1heSBvY2N1ciBhZnRlciBSU1RE
QUEgYW5kIGludGVyZmVyZSB3aXRoIHRoZQo+PiA+IGZvbGxvd2luZyBESVNFQyBjb21tYW5kIG9y
IHRoZSByZW1haW5pbmcgaW5pdGlhbGl6YXRpb24uCj4+ID4gCj4+ID4gU2VuZCBicm9hZGNhc3Qg
RElTRUMgYmVmb3JlIFJTVERBQSB0byBkaXNhYmxlIFNJUiwgbWFzdGVyIHJlcXVlc3QsCj4+ID4g
YW5kCj4+ID4gaG90LWpvaW4gZXZlbnRzIGJlZm9yZSByZXNldHRpbmcgZHluYW1pYyBhZGRyZXNz
ZXMuIFRoaXMgcHJldmVudHMKPj4gPiBzbGF2ZQo+PiA+IGV2ZW50cyBmcm9tIGRpc3J1cHRpbmcg
YnVzIGluaXRpYWxpemF0aW9uLgo+PiA+IAo+PiAKPj4gV2hpbGUgdGhlIHNlcXVlbmNlIHlvdSBz
dWdnZXN0ZWQgbWFraW5nIHNlbnNlIHRvIG1lLCBidXQgaSBhbQo+PiB3b25kZXJpbmcKPj4gYmVm
b3JlIGJ1c19pbml0LCBhcmUgdGhlcmUgcmVhbGx5IGEgdGFyZ2V0IGRldmljZSBnZXR0aW5nIHBv
d2VyZWQgdXAKPj4gd2hvCj4+IGNhbiBnZW5lcmF0ZSBob3Rqb2luID8KPj4gCj4+IE1ZIHVuZGVy
c3RhbmRpbmcgaXMsIHBvc3QgbWFzdGVyIHJlZ2lzdHJhdGlvbiBhbmQgYnVzX2luaXQgb25seQo+
PiB0YXJnZXQKPj4gZGV2aWNlcyBzaG91bGQgc3RhcnQgbGlmZSwgaXNuJ3QgaXQgPwo+PiAKPiAK
PiBUaGlzIHBhdGNoIGlzIG5vdCBpbnRlbmRlZCB0byBhZGRyZXNzIGFueSB0YXJnZXQgZGV2aWNl
IGJlaGF2aW9ycyB0aGF0Cj4gb2NjdXIgYmVmb3JlIGJ1c19pbml0IGl0c2VsZi4KPiAKPiBPdXIg
YWN0dWFsIGhhcmR3YXJlIHRlc3RpbmcgcmV2ZWFsZWQgdGhhdCBzb21lIHRhcmdldCBkZXZpY2Vz
IHdpbGwKPiBhY3RpdmVseSB0cmlnZ2VyIGEgSG90LUpvaW4gcmVxdWVzdCB3aXRoaW4gYSBzaG9y
dCB3aW5kb3cgYWZ0ZXIKPiByZWNlaXZpbmcgdGhlIFJTVERBQSBDQ0MuIEJ5IHNlbmRpbmcgdGhl
IGJyb2FkY2FzdCBESVNFQyBmaXJzdCwgd2UKPiBlbnN1cmUgdGhhdCBubyBzdWNoIEhvdC1Kb2lu
IHJlcXVlc3RzIGNhbiBiZSBmaXJlZCBhZnRlciBSU1REQUEsCj4gc3VjY2Vzc2Z1bGx5IHByZXZl
bnRpbmcgdGhpcyBpc3N1ZS4KPiAKPiBUaGVyZWZvcmUsIHNlbmRpbmcgYnJvYWRjYXN0IERJU0VD
IGJlZm9yZSBSU1REQUEgbWFrZXMgdGhlIGVudGlyZQo+IGluaXRpYWxpemF0aW9uIHNlcXVlbmNl
IG11Y2ggbW9yZSByb2J1c3QuCj4gCj4+IAo+PiA+IFNpZ25lZC1vZmYtYnk6IERlZmEgTGkgPGRl
ZmEubGlAbWVkaWF0ZWsuY29tPgo+PiA+IC0tLQo+PiA+IMKgIGRyaXZlcnMvaTNjL21hc3Rlci5j
IHwgMTYgKysrKysrKystLS0tLS0tLQo+PiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCj4+ID4gCj4+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNj
L21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPj4gPiBpbmRleCAwMWUwNWJhZDg2NjEu
LjRmZGM4ZjcyMTM2NCAxMDA2NDQKPj4gPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+PiA+
ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4+ID4gQEAgLTI1NzEsMTAgKzI1NzEsMTIgQEAg
c3RhdGljIGludCBpM2NfbWFzdGVyX2J1c19pbml0KHN0cnVjdAo+PiA+IGkzY19tYXN0ZXJfY29u
dHJvbGxlciAqbWFzdGVyKQo+PiA+IMKgwqDCoMKgwqAgfQo+PiA+IAo+PiA+IMKgwqDCoMKgwqAg
LyoKPj4gPiAtwqDCoMKgwqDCoCAqIFJlc2V0IGFsbCBkeW5hbWljIGFkZHJlc3MgdGhhdCBtYXkg
aGF2ZSBiZWVuIGFzc2lnbmVkCj4+ID4gYmVmb3JlCj4+ID4gLcKgwqDCoMKgwqAgKiAoYXNzaWdu
ZWQgYnkgdGhlIGJvb3Rsb2FkZXIgZm9yIGV4YW1wbGUpLgo+PiA+ICvCoMKgwqDCoMKgICogRGlz
YWJsZSBhbGwgc2xhdmUgZXZlbnRzIGJlZm9yZSBzdGFydGluZyBEQUEuIFdoZW4gbm8KPj4gPiBh
Y3RpdmUgZGV2aWNlCj4+ID4gK8KgwqDCoMKgwqAgKiBpcyBvbiB0aGUgYnVzLCByZXR1cm5zIE14
IGVycm9yIGNvZGUgTTIsIHRoaXMgZXJyb3IgaXMKPj4gPiBpZ25vcmVkLgo+PiA+IMKgwqDCoMKg
wqDCoCAqLwo+PiA+IC3CoMKgwqDCoCByZXQgPSBpM2NfbWFzdGVyX3JzdGRhYV9sb2NrZWQobWFz
dGVyLCBJM0NfQlJPQURDQVNUX0FERFIpOwo+PiA+ICvCoMKgwqDCoCByZXQgPSBpM2NfbWFzdGVy
X2VuZWNfZGlzZWNfbG9ja2VkKG1hc3RlciwKPj4gPiBJM0NfQlJPQURDQVNUX0FERFIsIGZhbHNl
LAo+PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSTNDX0NDQ19FVkVOVF9TSVIgfAo+PiA+IEkz
Q19DQ0NfRVZFTlRfTVIgfAo+PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSTNDX0NDQ19FVkVO
VF9ISiwgdHJ1ZSk7Cj4+ID4gwqDCoMKgwqDCoCBpZiAocmV0KQo+PiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gZXJyX2J1c19jbGVhbnVwOwo+PiA+IAo+PiA+IEBAIC0yNTg1LDEy
ICsyNTg3LDEwIEBAIHN0YXRpYyBpbnQgaTNjX21hc3Rlcl9idXNfaW5pdChzdHJ1Y3QKPj4gPiBp
M2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlcikKPj4gPiDCoMKgwqDCoMKgIH0KPj4gPiAKPj4g
PiDCoMKgwqDCoMKgIC8qCj4+ID4gLcKgwqDCoMKgwqAgKiBEaXNhYmxlIGFsbCBzbGF2ZSBldmVu
dHMgYmVmb3JlIHN0YXJ0aW5nIERBQS4gV2hlbiBubwo+PiA+IGFjdGl2ZSBkZXZpY2UKPj4gPiAt
wqDCoMKgwqDCoCAqIGlzIG9uIHRoZSBidXMsIHJldHVybnMgTXggZXJyb3IgY29kZSBNMiwgdGhp
cyBlcnJvciBpcwo+PiA+IGlnbm9yZWQuCj4+ID4gK8KgwqDCoMKgwqAgKiBSZXNldCBhbGwgZHlu
YW1pYyBhZGRyZXNzIHRoYXQgbWF5IGhhdmUgYmVlbiBhc3NpZ25lZAo+PiA+IGJlZm9yZQo+PiA+
ICvCoMKgwqDCoMKgICogKGFzc2lnbmVkIGJ5IHRoZSBib290bG9hZGVyIGZvciBleGFtcGxlKS4K
Pj4gPiDCoMKgwqDCoMKgwqAgKi8KPj4gPiAtwqDCoMKgwqAgcmV0ID0gaTNjX21hc3Rlcl9lbmVj
X2Rpc2VjX2xvY2tlZChtYXN0ZXIsCj4+ID4gSTNDX0JST0FEQ0FTVF9BRERSLCBmYWxzZSwKPj4g
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEkzQ19DQ0NfRVZFTlRfU0lSIHwKPj4gPiBJM0NfQ0ND
X0VWRU5UX01SIHwKPj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEkzQ19DQ0NfRVZFTlRfSEos
IHRydWUpOwo+PiA+ICvCoMKgwqDCoCByZXQgPSBpM2NfbWFzdGVyX3JzdGRhYV9sb2NrZWQobWFz
dGVyLCBJM0NfQlJPQURDQVNUX0FERFIpOwo+PiA+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9idXNfY2xlYW51cDsKPj4gPiAKPj4g
Cj4gCj4gVGhhbmtzLAo+IERlZmEKPiAKPiAKPiAqKioqKioqKioqKioqIE1FRElBVEVLIENvbmZp
ZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioKPiBUaGUgaW5mb3JtYXRpb24g
Y29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkKPiBhdHRhY2ht
ZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90
aGVyd2lzZQo+IGV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJ
dCBpcyBpbnRlbmRlZCB0byBiZQo+IGNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVj
aXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLAo+IGRpc3RyaWJ1dGlvbiwgcHJpbnRp
bmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzCj4g
YXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hp
Yml0ZWQgYW5kIG1heQo+IGJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCBy
ZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUKPiB0aGF0IHlvdSBoYXZlIHJlY2Vp
dmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIKPiBpbW1l
ZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwg
Y29waWVzIG9mCj4gdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20g
eW91ciBzeXN0ZW0sIGFuZCBkbyBub3QKPiBkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUt
bWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhCj4gCgoKLS0gCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
