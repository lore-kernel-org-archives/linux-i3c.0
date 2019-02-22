Return-Path: <SRS0=3YcD=Q5=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7161EC43381
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Feb 2019 17:41:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4022F206B6
	for <linux-i3c@archiver.kernel.org>; Fri, 22 Feb 2019 17:41:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IgBKNKcy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aGu2MwRC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4022F206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5UCDl4bnDv921xb5WaJL4aC1Z3KhUuJrFSCCet7Oxfo=; b=IgBKNKcypzYv47
	OIG0giFBSffjwuGsKhXx1sfw9cBUnaJoouFwBBAO5mdP8xXmqBaKvjF/zuZKub6BOEoz8VOolef3G
	RWx46o+tU7Z9WPrrWQu5Wy9yjGSw53UYcef9D9La/T5d9pir5lk+bNEyZ2wjzB0IR8C7y2oBr/7sc
	CZv8SZhZo5flaK5qx7Hz0lwkigAx4WRzY9aORXfMoGNO/s0BVH72QuUDKOmCb2QintWelcUYibIZh
	T4+zx1yjPQSgxcrbC7lfRPMsXd/xtICaiMzbk4CrHGtSB1sXTQBPMrJ6kGwqGIlzXRpp057ZpCYjC
	+GVDbM8JiN1t6qbzQw/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxEpd-0007OH-QR; Fri, 22 Feb 2019 17:41:53 +0000
Received: from smtprelay4.synopsys.com ([198.182.47.9]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxEpa-0007Ny-2Q
 for linux-i3c@lists.infradead.org; Fri, 22 Feb 2019 17:41:51 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id BC34424E24E2;
 Fri, 22 Feb 2019 09:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1550857307; bh=4Wqr/GKzUCA5dsuZoe5KqrgitdllNVUFpQVrN8I9rzg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To:From;
 b=aGu2MwRCLrgVX3QV1wgvQSdQ8wmNi4lx+kYGvMQUns89N1r8XGqk6n1VgpfY9LzZ9
 LMoYg2VzKFAyzHC3gVt6iIcl0NYJcK977kq4Oj5ooTVY7DjVcal9rmXO5/MTD3oSAf
 iOZMawLJMUxBjndAIfrjbsad/rLuGBH9NFZgr5NOOEioM/JtY+IUDrvlCAwgEoLLeW
 qQPDlEU84+uUDzvR02CDcVyH/nGXsZauMcfviYDLItMf3MN9OxtsXcW4027wbgnpgD
 ryPnv0caZV613/V40aLOXvF9xu2o5QzLQUrVos+ETBX4qh3phFpJaV/u6CKbbehxDX
 U7XjMqC+FwaGw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4FDDEA0079;
 Fri, 22 Feb 2019 17:41:46 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 22 Feb 2019 09:41:46 -0800
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.92) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 22 Feb 2019 18:41:44 +0100
Received: from [10.0.2.15] (10.107.25.80) by DE02WEHTCB.internal.synopsys.com
 (10.225.19.80) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Fri, 22 Feb 2019 18:41:43 +0100
Subject: Re: [PATCH 1/2] i3c: Add support for HDR modes.
To: Przemyslaw Gaj <pgaj@cadence.com>, Boris Brezillon <bbrezillon@kernel.org>
References: <cover.1544702829.git.pgaj@cadence.com>
 <efb3b8692d3579ab3369cc0f80e237550f3e8209.1544702829.git.pgaj@cadence.com>
 <cb17ee91-bad8-03d4-cc9f-e7095cf17011@synopsys.com>
 <20190222155238.3dc4ab8f@kernel.org>
 <20190222150248.GA28244@global.cadence.com>
From: vitor <vitor.soares@synopsys.com>
Message-ID: <a4d2b1b8-f30f-4c12-a7ab-1bd2bccf1666@synopsys.com>
Date: Fri, 22 Feb 2019 17:41:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190222150248.GA28244@global.cadence.com>
Content-Language: en-US
X-Originating-IP: [10.107.25.80]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_094150_119109_DB220A00 
X-CRM114-Status: GOOD (  14.12  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor <vitor.soares@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Ck9uIDIyLzAyLzE5IDE1OjAyLCBQcnplbXlzbGF3IEdhaiB3cm90ZToKPj4+PiAgc3RydWN0IGkz
Y19pYmlfcGF5bG9hZCB7Cj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaTNjL21hc3Rl
ci5oIGIvaW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmgKPj4+PiBpbmRleCBhZGE5NTZhLi5mZDUw
NDczIDEwMDY0NAo+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvaTNjL21hc3Rlci5oCj4+Pj4gKysr
IGIvaW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmgKPj4+PiBAQCAtMzg2LDYgKzM4NiwxMCBAQCBz
dHJ1Y3QgaTNjX2J1cyB7Cj4+Pj4gICAqCQkgIFRoaXMgbWV0aG9kIGlzIG1hbmRhdG9yeS4KPj4+
PiAgICogQHByaXZfeGZlcnM6IGRvIG9uZSBvciBzZXZlcmFsIHByaXZhdGUgSTNDIFNEUiB0cmFu
c2ZlcnMKPj4+PiAgICoJCVRoaXMgbWV0aG9kIGlzIG1hbmRhdG9yeS4KPj4+PiArICogQHNlbmRf
aGRyX2NtZHM6IHNlbmQgb25lIG9yIHNldmVyYWwgSERSIGNvbW1hbmRzLiBJZiB0aGVyZSBpcyBt
b3JlIHRoYW4gb25lCj4+Pj4gKyAqCQkgICBjb21tYW5kLCB0aGV5IHNob3VsZCBpZGVhbGx5IGJl
IHNlbnQgaW4gdGhlIHNhbWUgSERSCj4+Pj4gKyAqCQkgICB0cmFuc2FjdGlvbi4KPj4+PiArICoJ
CSAgIFRoaXMgbWV0aG9kIGlzIG9wdGlvbmFsLgo+Pj4+ICAgKiBAYXR0YWNoX2kyY19kZXY6IGNh
bGxlZCBldmVyeSB0aW1lIGFuIEkyQyBkZXZpY2UgaXMgYXR0YWNoZWQgdG8gdGhlIGJ1cy4KPj4+
PiAgICoJCSAgICBUaGlzIGlzIGEgZ29vZCBwbGFjZSB0byBhdHRhY2ggbWFzdGVyIGNvbnRyb2xs
ZXIgc3BlY2lmaWMKPj4+PiAgICoJCSAgICBkYXRhIHRvIEkyQyBkZXZpY2VzLgo+Pj4+IEBAIC00
NTcsNiArNDYxLDkgQEAgc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlcl9vcHMgewo+Pj4+ICAJ
aW50ICgqcHJpdl94ZmVycykoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LAo+Pj4+ICAJCQkgIHN0
cnVjdCBpM2NfcHJpdl94ZmVyICp4ZmVycywKPj4+PiAgCQkJICBpbnQgbnhmZXJzKTsKPj4+PiAr
CWludCAoKnNlbmRfaGRyX2NtZHMpKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwKPj4+PiArCQkJ
ICAgICBjb25zdCBzdHJ1Y3QgaTNjX2hkcl9jbWQgKmNtZHMsCj4+Pj4gKwkJCSAgICAgaW50IG5j
bWRzKTsKPj4+PiAgCWludCAoKmF0dGFjaF9pMmNfZGV2KShzdHJ1Y3QgaTJjX2Rldl9kZXNjICpk
ZXYpOwo+Pj4+ICAJdm9pZCAoKmRldGFjaF9pMmNfZGV2KShzdHJ1Y3QgaTJjX2Rldl9kZXNjICpk
ZXYpOwo+Pj4+ICAJaW50ICgqaTJjX3hmZXJzKShzdHJ1Y3QgaTJjX2Rldl9kZXNjICpkZXYsICAK
Pj4+IFdpdGggdGhpcyBhcHByb2FjaCB0aGUgY29udHJvbGxlciBiZXR3ZWVuIGEgc3RhcnQgYW5k
IHN0b3AgY2FuIG9ubHkgdHJhbnNtaXQgaW4gU0RSIG9yIEhEUi4KPj4+Cj4+PiBUaGlzIGlzIGxp
bWl0ZWQgZm9yIGRldmljZXMgdGhhdCBuZWVkIHRoZSBmb2xsb3dpbmcgZnJhbWU6Cj4+PiDCoMKg
wqAgPFN0YXJ0PjxTRFIgeGZlcj48UmVwZWF0ZWQgU3RhcnQ+PEhEUiBjb21tYW5kPjxTdG9wPgo+
IEFjdHVhbGx5LCB0aGVyZSBpcyByZXBlYXRlZCBzdGFydCBiZXR3ZWVuIFNEUiBhbmQgRU5USERS
LiBUaGVyZSBpcyBubyByZXBlYXRlZAo+IHN0YXJ0IGJldHdlZW4gRU5USERSIGFuZCBIRFIgY29t
bWFuZHMsIEhEUiBjb21tYW5kIGhhcyB0byBzdGFydCBpbW1lZGV0bHkgYWZ0ZXIKPiBFTlRIRFIu
IE9mIGNvdXJzZSwgaGRyIHJlc3RhcnQgbWF5IG9jY3VyIGJldHdlZW4gSERSIGNvbW1hbmRzLgoK
U29ycnksIEkgbWVhbnQgYWxsIEhEUiBmcmFtZS4KCgo+PiBJZiB0aGlzIGlzIGEgdXNlIGNhc2Ug
d2Ugd2FudCB0byBzdXBwb3J0LCB0aGVuIHdlIHNob3VsZCBwcm9iYWJseSBoYXZlCj4+IHNvbWV0
aGluZyBtb3JlIGdlbmVyaWMgdGhhbiB3aGF0IHdlIGN1cnJlbnRseSBoYXZlLgo+Pgo+PiBTb21l
dGhpbmcgbGlrZQo+Pgo+PiBlbnVtIGkzY194ZmVyX3R5cGUgewo+PiAJSTNDX0NDQ19YRkVSLAo+
PiAJSTNDX1NEUl9YRkVSLAo+PiAJSTNDX0hEUl9YRkVSLAo+PiB9Cj4+Cj4+IHN0cnVjdCBpM2Nf
eGZlciB7Cj4+IAllbnVtIGkzY194ZmVyX3R5cGUgdHlwZTsKPj4gCXVuaW9uIHsKPj4gCQlzdHJ1
Y3QgaTNjX2NjY19jbWQgY2NjOwo+PiAJCXN0cnVjdCBpM2NfcHJpdl94ZmVyIHNkcjsKPj4gCQlz
dHJ1Y3QgaTNjX2hkcl9jbWQgaGRyOwo+PiAJfTsKPj4gfQoKQEJvcmlzOiBJIHJlbWVtYmVyIHlv
dSBkb24ndCB3YW50IHRvIGV4cG9zZSBDQ0MgY29tbWFuZHMsIEkgdGhpbmsgYXQgbGVhc3QgZm9y
IG5vdyB3ZSBzaG91bGRuJ3QgZXhwb3NlIHRvby4KCkRvIHlvdSBhZ3JlZT8KCj4+IHN0cnVjdCBp
M2NfbWFzdGVyX2NvbnRyb2xsZXJfb3BzIHsKPj4gCS4uLgo+PiAJaW50ICgqaTNjX3hmZXJzKShz
dHJ1Y3QgaTNjX2Rldl9kZXNjICpkZXYsCj4+IAkJCSBzdHJ1Y3QgaTNjX3hmZXIgKnhmZXJzLAo+
PiAJCQkgaW50IG54ZmVycyk7Cj4+IAkuLi4KPj4gfTsKPiBJIGFncmVlLiBUaGlzIGlzIHNvbWV0
aGluZyB3ZSBzaG91bGQgdGhpbmsgb2YuCgoKQmVzdCByZWdhcmRzLApWaXRvciBTb2FyZXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWkzYyBt
YWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
